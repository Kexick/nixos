{ pkgs, ... }:

{
  users.users.tpws = {
    isSystemUser = true;
    group = "tpws";
  };

  users.groups.tpws = {};

  services.zapret = {
    enable = true;
    params = [
            "--filter-tcp=80 ˂HOSTLIST˃"
            "--dpi-desync=fake,fakedsplit"
            "--dpi-desync-autottl=2"
            "--dpi-desync-fooling=md5sig"
            "--new"
            "--filter-tcp=443"
            "--dpi-desync=fake,multidisorder"
            "--dpi-desync-fooling=badseq"
            "--dpi-desync-split-pos=midsld"
            "--dpi-desync-fake-tls=0x00000000"
          ];
    whitelist = [
            "7tv.app"
            "7tv.io"
            "accounts.google.com"
            "betterttv.net"
            "cloudflare-ech.com"
            "cloudflareaccess.com"
            "cloudflareapps.com"
            "cloudflarebolt.com"
            "cloudflareclient.com"
            "cloudflareinsights.com"
            "cloudflareok.com"
            "cloudflarepartners.com"
            "cloudflareportal.com"
            "cloudflarepreview.com"
            "cloudflareresolve.com"
            "cloudflaressl.com"
            "cloudflarestatus.com"
            "cloudflarestorage.com"
            "cloudflarestream.com"
            "cloudflaretest.com"
            "dis.gd"
            "discord-activities.com"
            "discord-attachments-uploads-prd.storage.googleapis.com"
            "discord.app"
            "discord.co"
            "discord.com"
            "discord.design"
            "discord.dev"
            "discord.gg"
            "discord.gift"
            "discord.gifts"
            "discord.media"
            "discord.new"
            "discord.status"
            "discord.store"
            "discordactivities.com"
            "discordapp.com"
            "discordapp.net"
            "discordcdn.com"
            "discordmerch.com"
            "discordpartygames.com"
            "discordsays.com"
            "discordsez.com"
            "encryptedsni.com"
            "ffzap.com"
            "frankerfacez.com"
            "ggpht.com"
            "googleadservices.com"
            "googleusercontent.com"
            "googlevideo.com"
            "gvt1.com"
            "jnn-pa.googleapis.com"
            "play.google.com"
            "wide-youtube.l.google.com"
            "youtu.be"
            "youtube-nocookie.com"
            "youtube-ui.l.google.com"
            "youtube.com"
            "youtube.googleapis.com"
            "youtubeembeddedplayer.googleapis.com"
            "youtubei.googleapis.com"
            "yt-video-upload.l.google.com"
            "yt.be"
            "ytimg.com"
    ];
  };
}
