{ config, pkgs, lib, ... }:

let
  fzfConfig = ''
    set -x FZF_DEFAULT_OPTS "--preview='bat {} --color=always'" \n
    set -x SKIM_DEFAULT_COMMAND "rg --files || fd || find ."
  '';
        starship = pkgs.starship;


in
{
  programs.fish = {
    enable = true;
    plugins = [{
     name="foreign-env";
     src = pkgs.fetchFromGitHub {
         owner = "oh-my-fish";
         repo = "plugin-foreign-env";
         rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
         sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
     };
 }];

    promptInit = ''
      eval (direnv hook fish)
      any-nix-shell fish --info-right | source
    '';

    interactiveShellInit = ''
			 source ("${starship}/bin/starship" init fish --print-full-init | psub)
		'';

    shellAliases = {
      cat  = "bat";
      dc   = "docker-compose";
      dps  = "docker-compose ps";
      dcd  = "docker-compose down --remove-orphans";
      du   = "ncdu --color dark -rr -x";
      ls   = "exa";
      ll   = "ls -a";
      mfix = "mill mono.__.fix --rules OrganizeImports && mill mono._.reformat";
      ".." = "cd ..";
      ping = "prettyping";
      k = "kubectl ";
      kcc = "kubectl config current-context ";
      kdp = "kubectl delete po ";
      kgc = "kubectl config get-contexts ";
      kge = "kubectl get events --sort-by='\'{.lastTimestamp}'\' ";
      kgp = "kubectl get po ";
      kl = "kubectl logs ";
      kpf = "kubectl port-forward ";
      ksc = "kubectl config use-context ";
      v = "nvim ";
      t = "tmux ";
      tls = "tmux ls ";
      ta = "tmux attach ";
    };
    shellInit = fzfConfig ;
  };


}
