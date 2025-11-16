{
  pkgs,
  host,
  ...
}:
let
  inherit (import ../../hosts/${host}/variables.nix) stylixImage;
  importYaml =
    file:
    builtins.fromJSON (
      builtins.readFile (
        pkgs.runCommandNoCC "yaml->json"
          {
            buildInputs = [ pkgs.yj ];
          }
          ''
            ( ${pkgs.yj}/bin/yj < ${file} | sed 's/"#/"/g' )> $out
          ''
      )
    );
  tokyoDark = importYaml (pkgs.base16-schemes + "/share/themes/synth-midnight-dark.yaml");

in
{
  # Styling Options
  stylix = {
    enable = true;
    autoEnable = true;
    image = stylixImage;
    base16Scheme = (tokyoDark).palette;
    # base16Scheme = {
    #   base00 = "#111111";
    #   base01 = "#333333";
    #   base02 = "#555555";
    #   base03 = "#777777";
    #   base04 = "#999999";
    #   base05 = "#aaaaaa";
    #   base06 = "#cccccc";
    #   base07 = "#ffffff";
    #   base08 = "#aa0000";
    #   base09 = "#aa5555";
    #   base0A = "#aa5500";
    #   base0B = "#00aa00";
    #   base0C = "#00aaaa";
    #   base0D = "#0000aa";
    #   base0E = "#aa00aa";
    #   base0F = "#555500";
    #   base10 = "#050505";
    #   base11 = "#000000";
    #   base12 = "#ff5555";
    #   base13 = "#ffff55";
    #   base14 = "#55ff55";
    #   base15 = "#55ffff";
    #   base16 = "#5555ff";
    #   base17 = "#ff55ff";
    # };
    polarity = "dark";
    opacity.terminal = 1.0;
    targets.gtk.enable = true;
    # targets.emacs.enable = true;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 11;
        popups = 12;
      };
    };
  };
}
