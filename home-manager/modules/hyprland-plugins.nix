{ pkgs, config, ... }:

let
  hyprspace  = pkgs.hyprlandPlugins.hyprspace;
  hyprpicker = pkgs.hyprpicker;
  grim       = pkgs.grim;
in {
home.file.".config/hypr/modules/plugins-aliases.conf".text = ''
$hyprspace  = ${hyprspace}/lib/libhyprspace.so
$hyprpicker = ${hyprpicker}/bin/hyprpicker
$grim       = ${grim}/bin/grim
'';
}

