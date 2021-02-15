{ config, pkgs, lib, ... }:

let
  # fzfConfig = ''
  #   set -x FZF_DEFAULT_OPTS "--preview='bat {} --color=always'" \n
  #   set -x SKIM_DEFAULT_COMMAND "rg --files || fd || find ."
  # '';
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
      "-" = "cd - ";
      ping = "prettyping";
      k = "kubectl ";
      h = "history";
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
      tns = "tmux new-session -s ";
      tas = "tmux attach -t ";
      tks = "tmux kill-session -t ";
      ta = "tmux attach ";
      hy = "history";
      gp = "git pull";
      gcl = "git clone ";
      gc = "git commit -am ";
      gco = "git checkout ";
      gps = "git push";
      gpt = "git push --tags";
      gs = "git status";
      gd = "git diff ";
      pullall = "find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;";
      art = "cd ~/documents/articles";
      lang = "cd ~/documents/languages";
      glot = "cd ~/development/glottologist";
      ont = "cd ~/development/ontologi";
      int = "cd ~/development/intendaglobal";
      intplat = "cd ~/development/intendaglobal/platform";
      ref = "cd ~/development/reference";

    };
    # shellInit = fzfConfig ;
   
  };


}
