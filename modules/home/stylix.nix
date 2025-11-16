_: {
  stylix.autoEnable = true;
  stylix.targets = {
    waybar.enable = false;
    rofi.enable = false;
    emacs.enable = true;
    hyprland.enable = false;
    hyprlock.enable = false;
    ghostty.enable = false;
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
