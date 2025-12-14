{ pkgs, ... }:
{
  # Only enable either docker or podman -- Not both
  virtualisation = {
    docker = {
      enable = true;
    };

    podman.enable = false;

    libvirtd = {
      enable = true;
    };

    virtualbox.host = {
      enable = false;
      enableExtensionPack = true;
    };
    spiceUSBRedirection.enable = true;
  };

  programs = {
    virt-manager.enable = true;
  };
  users.groups.libvirtd.members = [ "tay" ];

  environment.systemPackages = with pkgs; [
    virt-viewer # View Virtual Machines
    lazydocker
    docker-client
  ];
}
