{ config, lib, pkgs, stdenv, ... }:
let
  unstable  = import (import ./unstable.nix) {};

    unstablePkgs = [ ];

  defaultPkgs = with pkgs; [
    act                  # run github actions locally
    any-nix-shell        # fish support for nix shell
    bottom               # alternative to htop & ytop
    cachix               # nix caching
    dconf2nix            # dconf (gnome) files to nix converter
    docker-compose       # docker manager
    dive                 # explore docker layers
    exa                  # a better `ls`
    fd                   # "find" for files
    hyperfine            # command-line benchmarking tool
    killall              # kill processes by name
    libreoffice          # office suite
    libnotify            # notify-send command
    ncdu                 # disk space info (a better du)
    neofetch             # command-line system information
    nix-doc              # nix documentation search tool
    nyancat              # the famous rainbow cat!
    manix                # documentation searcher for nix
    mupdf                # pdf viewer with vim-like keybindings
    prettyping           # a nicer ping
    ripgrep              # fast grep
    rnix-lsp             # nix lsp server
    terminator           # great terminal multiplexer
    tldr                 # summary of a man page
    tree                 # display files in a tree view
    xclip                # clipboard support (also for neovim)

    # fixes the `ar` error required by cabal
    binutils-unwrapped
  ];

  gitPkgs = with pkgs.gitAndTools; [
    diff-so-fancy # git diff with colors
    git-crypt     # git files encryption
    hub           # github command-line client
    tig           # diff and commit view
  ];

  haskellPkgs = with pkgs.haskellPackages; [
    brittany                # code formatter
    cabal2nix               # convert cabal projects to nix
    cabal-install           # package manager
    ghc                     # compiler
    haskell-language-server # haskell IDE (ships with ghcide)
    hoogle                  # documentation
    nix-tree                # visualize nix dependencies
  ];


in
{
  programs.home-manager.enable = true;


  imports = [
    ./programs/sourcecontrol/default.nix
    ./programs/terminal/default.nix
    ./programs/editor/default.nix

  ];


  home = {
    username      = "jason";
    homeDirectory = "/home/jason";
    stateVersion  = "20.09";


    packages = defaultPkgs ++ gitPkgs  ++ haskellPkgs;

    sessionVariables = {
      DISPLAY = ":0";
      EDITOR = "nvim";
    };
  };


}