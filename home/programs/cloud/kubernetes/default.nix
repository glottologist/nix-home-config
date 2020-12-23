{ lib, config, pkgs, ... }:

{

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

  
}
