{ config, lib, pkgs, stdenv, ... }:
{
  programs.home-manager.enable = true;


  imports = [
    ./programs/sourcecontrol/default.nix

  ];


  home = {
    username      = "jason";
    homeDirectory = "/home/jason";
    stateVersion  = "20.09";

    sessionVariables = {
      DISPLAY = ":0";
      EDITOR = "nvim";
    };
  };


}