{
  lib,
  fetchFromGitHub,
  hyprland,
  hyprlandPlugins,
  pkg-config,
}:
hyprlandPlugins.mkHyprlandPlugin hyprland {
  pluginName = "hyprNStack";
  version = "0eb3c1fee1f33c632498dc598488412133ca5e3c";

  src = fetchFromGitHub {
    owner = "zakk4223";
    repo = "hyprNStack";
    rev = "1959ecb";
    hash = "sha256-LL1+gGBQcb+P0hiCGhHKDIhy7+UqwUBmU+kh0YQTYI0=";
  };

  # Native build tools required for the plugin
  nativeBuildInputs = [ pkg-config ]; # nie jestem tego pewnien czy to jest potrzebne

  # Set additional build inputs if required
  # Hyprland and its dependencies are included by default
  buildInputs = [ ];

  # stolen from https://github.com/lemonlambda/dots/blob/3a811718ea983b49fff385b15320f7dd7b3ca633/modules/home/hyprland-custom-plugins/hyprNStack.nix#L11
  buildPhase = ''
    make all
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/lib
    cp nstackLayoutPlugin.so $out/lib/libhyprNStack.so
    runHook postInstall
  '';

  # Metadata about the plugin
  meta = {
    homepage = "https://github.com/zakk4223/hyprNStack";
    description = "Hyprland plugin for N-stack layout";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}
