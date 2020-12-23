{ fontSize, pkgs, ... }:

{
    programs.newsboat = {
      enable = true;
 urls = (map (x: {url = x; tags = ["maintaining"];}) [
		"https://discourse.nixos.org/latest.rss"
	  ]) ;
		reloadTime = 5;

    };

}
