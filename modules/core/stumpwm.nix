{
  config,
  pkgs,
  lib,
  ...
}:
let
  stumpwm-wrapper = pkgs.callPackage ./stumpwm-wrapper.nix { };
in
{
  services.gnome.gnome-keyring.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
  };

  services.xserver.windowManager.session = pkgs.lib.singleton {
    name = "stumpwm";
    start = ''
      ${stumpwm-wrapper}/bin/stumpwm &
       waitPID=$!
    '';
  };

  services.picom = {
    enable = true;
  };

  services.xserver.enable = true; # for xlockmore to work, enables PAM

  environment.systemPackages = with pkgs; [
    stumpwm-wrapper
    dunst
    stalonetray
    feh
    light
    blueman
    lxde.lxsession
    libnotify
    notify-desktop
    hydroxide
    inputplug
    xss-lock
    xlockmore
    pavucontrol
    playerctl
    mpd
    mpc-cli
    ncmpcpp
    mpdris2
    stumpish
  ];

}
