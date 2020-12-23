{ config, lib, pkgs, stdenv, ... }:

{

  imports = [
    ./tmux/default.nix
    ./fish/default.nix
    ./alacritty/default.nix
  ];

}