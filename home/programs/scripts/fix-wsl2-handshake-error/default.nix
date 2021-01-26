{ config, lib, pkgs, stdenv, ... }:

let
  
  scriptText = builtins.readFile ./script/script.sh;
  buildScript = pkgs.writeTextFile {
    name = "fix-wsl2-handshake-error";
    executable = true;
    destination = "/bin/fix-wsl2-handshake-error.sh";
    text = scriptText ;
  };
in stdenv.mkDerivation rec {
  pname = "fix-wsl2-handshake-error";
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
      ln -sf ${myScript}/bin/fix-wsl2-handshake-error.sh $out/bin/fix-wsl2-handshake-error.sh
    '';
  };
}