{ fontSize, pkgs, ... }:

{
    programs.direnv = {
      enable = true;
      enableFishIntegration = true;
      enableNixDirenvIntegration = true;
    };

}
