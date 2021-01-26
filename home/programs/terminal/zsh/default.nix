{ config, pkgs, lib, ... }:

let
  fzfConfig = ''
    set -x FZF_DEFAULT_OPTS "--preview='bat {} --color=always'" \n
    set -x SKIM_DEFAULT_COMMAND "rg --files || fd || find ."
  '';
  starship = pkgs.starship;


in
{


  programs.zsh = {
    enable = true;
    plugins = [{
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.1.0";
          sha256 = "0snhch9hfy83d4amkyxx33izvkhbwmindy0zjjk28hih1a9l2jmx";
        };
 }];

    promptInit = ''
      eval (direnv hook zsh)
      any-nix-shell zsh --info-right | source
    '';

    interactiveShellInit = ''
			 source ("${starship}/bin/starship" init zsh --print-full-init | psub)
		'';

    shellAliases = {
      setmtu = "sudo ip link set dev eth0 mtu 1350"; 
      cat  = "bat";
      dc   = "docker-compose";
      dps  = "docker-compose ps";
      dcd  = "docker-compose down --remove-orphans";
      du   = "ncdu --color dark -rr -x";
      ls   = "exa";
      ll   = "ls -a";
      lar  = "ls -laR";
      mfix = "mill mono.__.fix --rules OrganizeImports && mill mono._.reformat";
      ".." = "cd ..";
      ping = "prettyping";
      k = "kubectl ";
      kdp = "kubectl delete pod ";
      kgn = "kubectl get nodes";
      kdn = "kubectl describe node ";
      kge = "kubectl get events --sort-by='\'{.lastTimestamp}'\' ";
      kgp = "kubectl get pod ";
      kl = "kubectl logs ";
      kpf = "kubectl port-forward ";
      kcp = "kubectl cp ";
      kx = "kubectx ";
      kn = "kubens ";
      v = "nvim ";
      t = "tmux ";
      tls = "tmux ls ";
      ta = "tmux attach ";
      hy = "history";
      gp = "git pull";
      gc = "git commit -am ";
      gpl = "git push";
      gpt = "git push --tags";
    };
    shellInit = fzfConfig ;
   
  };


}
