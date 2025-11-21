{ pkgs, ... }:
{
  services.udev.extraRules = ''
    # Allow user access to some USB devices.                                          
    SUBSYSTEM=="usb", ATTR{idVendor}=="03f0", ATTR{idProduct}=="6e12", TAG+="uaccess", MODE="0664", 
  '';
  hardware = {
    sane = {
      enable = true;
      extraBackends = [
        pkgs.sane-airscan
        pkgs.hplipWithPlugin
      ];
      disabledDefaultBackends = [ "escl" ];
    };
    logitech.wireless.enable = false;
    logitech.wireless.enableGraphical = false;
    opentabletdriver.enable = true;
    graphics.enable = true;
    enableRedistributableFirmware = true;
    keyboard.qmk.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };
  local.hardware-clock.enable = false;
}
