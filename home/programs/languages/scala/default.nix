{ pkgs, ... }:

{
  home.packages = with pkgs.haskellPackages; [

    # Some commonly used tools
    metals
  ];


}