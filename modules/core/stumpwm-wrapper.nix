{
  stdenv,
  sbcl,
  writeShellApplication,
}:
let
  sbclWithStumpwm = sbcl.withPackages (ps: [
    ps.stumpwm
    ps.clx-truetype
    ps.xembed
    ps.xml-emitter
    ps.slynk
    ps.dbus
  ]);
in
writeShellApplication {
  name = "stumpwm";
  runtimeInputs = [ sbclWithStumpwm ];
  text = ''
    ${sbclWithStumpwm}/bin/sbcl \
      --non-interactive \
      --eval '(require :asdf)' \
      --eval '(asdf:load-system :stumpwm)' \
      --eval '(stumpwm:stumpwm)'
  '';
}
