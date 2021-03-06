{ config, lib, pkgs, stdenv, ... }:
let
  unstable  = import (import ./unstable.nix) {};

    unstablePkgs = [ ];

  defaultPkgs = with pkgs; [
    jq
    niv
    act                  # run github actions locally
    any-nix-shell        # fish support for nix shell
    bottom               # alternative to htop & ytop
   #cachix               # nix caching
    dconf2nix            # dconf (gnome) files to nix converter
    docker-compose       # docker manager
    dive                 # explore docker layers
    exa                  # a better `ls`
    fd                   # "find" for files
    hyperfine            # command-line benchmarking tool
    killall              # kill processes by name
    libnotify            # notify-send command
    ncdu                 # disk space info (a better du)
    neofetch             # command-line system information
    nix-doc              # nix documentation search tool
    nyancat              # the famous rainbow cat!
    manix                # documentation searcher for nix
    prettyping           # a nicer ping
    ripgrep              # fast grep
    rnix-lsp             # nix lsp server
    terminator           # great terminal multiplexer
    tldr                 # summary of a man page
    tree                 # display files in a tree view
    xclip                # clipboard support (also for neovim)
    # fixes the `ar` error required by cabal
    binutils-unwrapped
    mop
    aerc
    ansible
    dos2unix
  ];

  nodejsPkgs = with pkgs; [
    nodejs-15_x # nodejs
  ];


  gitPkgs = with pkgs.gitAndTools; [
    diff-so-fancy # git diff with colors
    git-crypt     # git files encryption
    hub           # github command-line client
    tig           # diff and commit view
  ];



  kubePkgs = with pkgs; [
     kubectl
     kubectx
     k9s
     popeye
    cloudfoundry-cli
    awscli
    azure-cli
    google-cloud-sdk
  #  openshift-origin
    stern
  ];
  
  fonts = with pkgs; [
      # dejavu_fonts
      #jetbrains-mono
      # emacs-all-the-icons-fonts
      # emojione
      # fantasque-sans-mono
      fira-code
      fira-mono
      fira-code-symbols
      nerdfonts
      font-awesome-ttf
      google-fonts
      hack-font
      # hasklig
      # iosevka
      # noto-fonts-emoji
      # material-icons
      cascadia-code
      # noto-fonts
      # noto-fonts-cjk
      # noto-fonts-emoji
      # proggyfonts
       (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];

in
{
  programs.home-manager.enable = true;


  imports = [
    ./programs/sourcecontrol/default.nix
    ./programs/terminal/default.nix
    ./programs/editor/default.nix
    ./programs/languages/default.nix
  ];


  home = {
    username      = "jason";
    homeDirectory = "/home/jason";
    stateVersion  = "20.09";


    packages = defaultPkgs ++ gitPkgs ++ nodejsPkgs ++ kubePkgs ++ fonts;

    sessionVariables = {
      DISPLAY = ":0";
      EDITOR = "nvim";
      SHELL = "fish";
    };
  };

  
  


}
