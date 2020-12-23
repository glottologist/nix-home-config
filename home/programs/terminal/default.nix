{ config, lib, pkgs, stdenv, ... }:

{

  imports = [
    ./tmux/default.nix
    ./fish/default.nix
    ./alacritty/default.nix
    ./broot/default.nix
    ./bat/default.nix
    ./direnv/default.nix
    ./fzf/default.nix
    ./gpg/default.nix
    ./htop/default.nix
    ./aria2/default.nix
    ./mcfly/default.nix
    ./mcflsdly/default.nix   
    ./newsboat/default.nix   
   ./pet/default.nix 
      ./taskwarrior/default.nix 
  ];

}