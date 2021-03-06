{ config, lib, pkgs, stdenv, ... }:

{

  imports = [
    ./tmux/default.nix
    ./alacritty/default.nix 
    ./broot/default.nix
    ./bat/default.nix
    ./direnv/default.nix
    ./fzf/default.nix
    ./gpg/default.nix
    ./htop/default.nix
    ./aria2/default.nix
    ./mcfly/default.nix
    ./lorri/default.nix   
    ./lsd/default.nix   
    ./newsboat/default.nix   
    ./pet/default.nix 
    ./taskwarrior/default.nix 
    ./starship/default.nix
    ./fish/default.nix
    ./zsh/default.nix
    ./tmate/default.nix
  ];

}