{ pkgs, ... }:
{
  home.packages = with pkgs; [ pyprland ];

  home.file.".config/hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = [
      "scratchpads",
    ]

    [scratchpads.term]
    animation = "fromBottom"
    command = "kitty --class kitty-dropterm"
    class = "kitty-dropterm"
    size = "70% 70%"
    margin = 38
    max_size = "5120px 100%"

    [scratchpads.irc]
    animation = "fromTop"
    command = "kitty --class kitty-irc-dropterm"
    class = "kitty-irc-dropterm"
    size = "70% 70%"
    margin = 38
    max_size = "1280px 70%"
  '';
}
