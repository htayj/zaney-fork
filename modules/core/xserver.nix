{ host, pkgs, ... }:
let
  inherit (import ../../hosts/${host}/variables.nix) keyboardLayout;
in
{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "${keyboardLayout}";
      variant = "";
    };
    xrandrHeads = [
      {
        output = "DP-0";
        primary = true;

      }
      {
        output = "HDMI-0";
      }
    ];
    dpi = 116;
    displayManager.sessionCommands = "${pkgs.xorg.xmodmap}/bin/xmodmap ${pkgs.writeText "xkb-layout" ''
      ! Map umlauts to RIGHT ALT + <key>
        keycode 134 = Hyper_L
        clear Mod4
        add Mod4 = Super_L
        keycode 137 = SunFront

        ! disable capslock
        ! remove Lock = Caps_Lock
    ''}";
  };
}
