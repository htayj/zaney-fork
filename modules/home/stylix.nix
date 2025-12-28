_: {
  stylix.autoEnable = false;
  stylix.targets = {
    waybar.enable = false;
    rofi.enable = false;
    emacs.enable = false;
    hyprland.enable = false;
    hyprlock.enable = false;
    ghostty.enable = false;
    # xorg.enable = false;
    # xresources.enable = false;
    firefox = {
      enable = true;
      profileNames = [ "default" ];
    };
    gtk = {
      enable = true;
    };
    qt = {
      enable = true;
      platform = "qtct";
    };
  };
}
