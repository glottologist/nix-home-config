{ config, lib, pkgs, stdenv, ... }:

{

  imports = [
    ./haskell/default.nix
    ./scala/default.nix
  ];

}