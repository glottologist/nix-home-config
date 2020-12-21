#! /usr/bin/env bash


# Shows the output of every command
set +x

# Pin Nixpkgs to NixOS unstable on June 15th of 2020
export PINNED_NIX_PKGS="https://github.com/NixOS/nixpkgs-channels/archive/0a146054bdf.tar.gz"

# Home manager - Pin to master on June 15th of 2020
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

cp -r home/* $HOME/.config/nixpkgs/

# Home manager
mkdir -p $HOME/.config/nixpkgs/
cp -r home/* $HOME/.config/nixpkgs/
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install
mkdir -p $HOME/Pictures
cp home/nixos.png $HOME/Pictures/
home-manager switch




