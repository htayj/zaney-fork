{ ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/sas-main/media/music";
    network.startWhenNeeded = true;
  };
}
