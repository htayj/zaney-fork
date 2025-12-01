{ pkgs }:
{
  programs.emacs = {
    enable = true;
    extraPackages =
      epkgs: with epkgs; [
        tsc
        tree-sitter-langs
        tree-sitter
      ];
  };
}
