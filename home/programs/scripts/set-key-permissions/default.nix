{ config, lib, pkgs, stdenv, ... }:

let
  
  scriptText = builtins.readFile ./script/script.sh;
  buildScript = pkgs.writeTextFile {
    name = "set-key-permissions";
    executable = true;
    destination = "/bin/set-key-permissions.sh";
    text = scriptText ;
  };
in stdenv.mkDerivation rec {
  pname = "set-key-permissions";
  version = "0.0.1";

  # Copy the script defined in the `let` statement above into the final
  # derivation.
  #
  buildInputs = [ buildScript ];
  builder = pkgs.writeTextFile {
    name = "builder.sh";
    text = ''
      . $stdenv/setup
      mkdir -p $out/bin
      ln -sf ${myScript}/bin/set-key-permissions.sh $out/bin/set-key-permissions.sh
    '';
  };
}