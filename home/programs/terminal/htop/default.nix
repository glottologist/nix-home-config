{ fontSize, pkgs, ... }:

{
     programs.htop = {
      enable = true;
      sortDescending = true;
      sortKey = "PERCENT_CPU";
    };
}
