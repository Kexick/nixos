{
  config,
  pkgs,
  ...
}: let
  tunDev = "tun0";
  tunAddr = "198.18.0.1/15";
  socksAddr = "127.0.0.1:1083";
  fwmark = 255;
  routeTable = 100;
in {
  systemd.services = {
    xray-tun-resume = {
      description = "Restart xray-tun after sleep";
      after = [
        "suspend.target"
        "hibernate.target"
        "hybrid-sleep.target"
        "suspend-then-hibernate.target"
      ];
      wantedBy = [
        "suspend.target"
        "hibernate.target"
        "hybrid-sleep.target"
        "suspend-then-hibernate.target"
      ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.systemd}/bin/systemctl restart xray-tun.service";
      };
    };
    xray-tun = {
      description = "tun2socks tunnel for xray";
      after = ["xray.service" "network-online.target"];
      requires = ["xray.service"];
      wants = ["network-online.target"];
      wantedBy = ["multi-user.target"];

      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.tun2socks}/bin/tun2socks -device ${tunDev} -proxy socks5://${socksAddr}";
        ExecStartPost = pkgs.writeShellScript "xray-tun-up" ''
                  for i in $(seq 1 50); do
                    ${pkgs.iproute2}/bin/ip link show ${tunDev} >/dev/null 2>&1 && break
                    sleep 0.1
                  done

                  GW=$(${pkgs.iproute2}/bin/ip route show default | grep -oP 'via \K[0-9.]+' | head -1)
                  VPS_IP=$(${pkgs.dnsutils}/bin/dig +short $(cat ${config.sops.secrets."xray/address".path}) | head -1)

                  ${pkgs.iproute2}/bin/ip addr add ${tunAddr} dev ${tunDev}
                  ${pkgs.iproute2}/bin/ip link set ${tunDev} up

                  ${pkgs.iproute2}/bin/ip route replace default via $GW table ${toString routeTable}
                  ${pkgs.iproute2}/bin/ip rule add fwmark ${toString fwmark} lookup ${toString routeTable} priority 100

                  ${pkgs.iproute2}/bin/ip route add "$VPS_IP/32" via $GW

                  ${pkgs.iproute2}/bin/ip route add default dev ${tunDev} metric 1

                  ${pkgs.nftables}/bin/nft -f - <<'NFT'
          table inet xray_mark {
            chain output {
              type route hook output priority mangle;
              meta mark 255 ct mark set meta mark
              ct mark 255 meta mark set ct mark
            }
            chain prerouting {
              type filter hook prerouting priority mangle;
              meta mark set ct mark
            }
          }
          NFT
        '';

        ExecStopPost = pkgs.writeShellScript "xray-tun-down" ''
          VPS_IP=$(${pkgs.dnsutils}/bin/dig +short $(cat ${config.sops.secrets."xray/address".path}) | head -1)
          ${pkgs.iproute2}/bin/ip route del default dev ${tunDev} 2>/dev/null || true
          ${pkgs.iproute2}/bin/ip route del "$VPS_IP/32" 2>/dev/null || true
          ${pkgs.iproute2}/bin/ip rule del fwmark ${toString fwmark} lookup ${toString routeTable} 2>/dev/null || true
          ${pkgs.iproute2}/bin/ip route flush table ${toString routeTable} 2>/dev/null || true
          ${pkgs.nftables}/bin/nft delete table inet xray_mark 2>/dev/null || true
        '';

        Restart = "on-failure";
        RestartSec = 5;
      };
    };
  };
}
