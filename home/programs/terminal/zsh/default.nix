{ config, pkgs, lib, ... }:

let
  fzfConfig = ''
    set -x FZF_DEFAULT_OPTS "--preview='bat {} --color=always'" \n
    set -x SKIM_DEFAULT_COMMAND "rg --files || fd || find ."
  '';
  starship = pkgs.starship;

  zshnixshell=  pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.1.0";
          sha256 = "0snhch9hfy83d4amkyxx33izvkhbwmindy0zjjk28hih1a9l2jmx";
        };

    powerlevel10k   = pkgs.fetchFromGitHub {
    owner = "romkatv";
    repo = "powerlevel10k";
    rev = "b7d90c84671183797bdec17035fc2d36b5d12292";
    sha256 = "0nzvshv3g559mqrlf4906c9iw4jw8j83dxjax275b2wi8ix0wgmj";
  };

in
{


  programs.zsh = {
    enable = true;
    plugins = [{
        name = "zsh-nix-shell";
        src = zshnixshell;
 }
 
 {
        name = "powerlevel10k";
        src =powerlevel10k; 
 }
 ];

   #promptInit = ''
   #  eval (direnv hook zsh)
   #  any-nix-shell zsh --info-right | source
   #'';


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
