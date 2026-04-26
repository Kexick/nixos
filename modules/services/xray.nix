{
  config,
  pkgs,
  ...
}: let
  s = config.sops.placeholder;
in {
  services.xray = {
    enable = true;
    settingsFile = config.sops.templates."config.json".path;
  };

  systemd.services.xray.environment = let
    assets = pkgs.symlinkJoin {
      name = "xray-assets";
      paths = [
        pkgs.v2ray-geoip
        pkgs.v2ray-domain-list-community
      ];
    };
  in {
    XRAY_LOCATION_ASSET = "${assets}/share/v2ray";
  };

  sops.templates."config.json" = {
    owner = "root";
    group = "root";
    mode = "0400";

    content = ''
      {
        "dns": {
          "queryStrategy": "UseIP",
          "servers": [
            {
            "address": "8.8.8.8",
            "skipFallback": false
            }
          ],
          "tag": "dns_out"
        },
        "inbounds": [
          {
            "port": 1083,
            "listen": "127.0.0.1",
            "protocol": "mixed",
            "settings": {
              "auth": "noauth",
              "udp": true,
              "userLevel": 8 },
            "sniffing": {
              "destOverride": [
                "http",
                "tls",
                "quic",
                "fakedns"
              ],
              "enabled": true
            },
            "tag": "mixed"
          },
          {
            "port": 1084,
            "listen": "127.0.0.1",
            "protocol": "http",
            "settings": {
              "userLevel": 8
            },
            "tag": "http"
          }
        ],
        "log": {
          "loglevel": "warning"
        },
        "outbounds": [
          {
            "protocol": "vless",
            "tag": "proxy",
            "streamSettings": {
              "network": "tcp",
              "security": "reality",
              "realitySettings": {
                "fingerprint": "chrome",
                "mldsa65Verify": "${s."xray/mldsa65Verify"}",
                "publicKey": "K9WETldjTK1qtt1l06wll4YPbjgWtAs7Lm7wuaV9bnI",
                "serverName": "max.ru",
                "shortId": "${s."xray/shortId"}",
                "show": false,
                "spiderX": "${s."xray/spiderX"}"
              },
              "tcpSettings": {
                "header": {
                "type": "none"
                }
              }
            },
            "settings": {
              "address": "${s."xray/address"}",
              "encryption": "${s."xray/encryption"}",
              "id": "${s."xray/id"}",
              "port": 10271
            }
          },
          {
          "protocol": "freedom",
            "settings": {
              "domainStrategy": "AsIs",
              "noises": [],
              "redirect": ""
            },
          "tag": "direct"
          },
          {
          "protocol": "blackhole",
            "settings": {
              "response": {
              "type": "http"
              }
          },
            "tag": "block"
          }
        ],
        "policy": {
          "levels": {
            "8": {
            "connIdle": 300,
            "downlinkOnly": 1,
            "handshake": 4,
            "uplinkOnly": 1
            }
          },
          "system": {
            "statsOutboundDownlink": true,
            "statsOutboundUplink": true
          }
        },
        "remarks": "Reallity",
        "routing": {
          "domainStrategy": "AsIs",
          "rules": [
            {
              "type": "field",
              "outboundTag": "block",
              "domain": ["geosite:category-ads-all"]
            },
            {
              "type": "field",
              "outboundTag": "direct",
              "ip": ["geoip:private"]
            },
            {
              "type": "field",
              "outboundTag": "direct",
              "ip": ["geoip:ru"]
            },
            {
              "type": "field",
              "outboundTag": "direct",
              "domain": ["geosite:category-ru"]
            },
            {
              "network": "tcp,udp",
              "outboundTag": "proxy",
              "type": "field"
            }
          ]
        },
        "stats": {}
      }
    '';
  };
}
