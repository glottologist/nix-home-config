{ config, pkgs, lib, ... }:

let
  fzfConfig = ''
    set -x FZF_DEFAULT_OPTS "--preview='bat {} --color=always'" \n
    set -x SKIM_DEFAULT_COMMAND "rg --files || fd || find ."
  '';
	ponysay = pkgs.ponysay;
	pokemonsay = mariusnur.pokemonsay;
	cowsay = pkgs.callPackage <mariusnur/pkgs/cowsay.nix> {packages = [mariusnur.cowsay-files];};
	lolcat = pkgs.lolcat;
        starship = pkgs.starship;
	fortunefuturama = fetchzip {
		url = "https://www.netmeister.org/apps/fortune-mod-futurama-0.2.tar.gz";
		sha256 = "0b9zs0r2jml3cqiv5wcinhv1wmcgzk2r07wy298g08ya94x9xan6";
	};
	fortune = pkgs.fortune;

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
			set number (random 0 10)
			if test $number -ge 8
				${ponysay}/bin/ponysay --ponyonly --anypony
			else if test $number -ge 5
				${ponysay}/bin/ponysay -q
			else if test $number -ge 3
				${fortune}/bin/fortune | ${pokemonsay}/bin/pokemonsay
			else if test $number -ge 1
				${cowsay}/bin/cowsay -f (ls ${cowsay}/share/cows | shuf -n1) (${fortune}/bin/fortune)
			else
				${cowsay}/bin/cowsay -f zoidberg (${fortune}/bin/fortune ${fortunefuturama}/futurama)
 			end
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
home.packages = [
		lolcat pokemonsay cowsay ponysay fortune
	];

}
