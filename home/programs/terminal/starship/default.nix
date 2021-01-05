{ fontSize, pkgs, ... }:

{
    programs.starship = {
      enable = true;

settings = {
    # See docs here: https://starship.rs/config/
    # Many symbols are taken from recomendations here:
    # https://starship.rs/presets/#nerd-font-symbols

    aws.symbol = "";

    battery = {
      full_symbol = "";
      charging_symbol = "";
      discharging_symbol = "";
      display.threshold = 25; # display battery information if charge is <= 25%
    };

    conda.symbol = " ";

    directory = {
      fish_style_pwd_dir_length = 1; # turn on fish directory truncation
      truncation_length = 2; # number of directories not to truncate
    };

    dart.symbol = " ";

    docker.symbol = " ";

    elixir.symbol = " ";

    elm.symbol = " ";

    gcloud.disabled = true;

    git_branch.symbol = " ";

    git_state = {
      rebase = "咽";
      merge = "";
      revert = "";
      cherry_pick = "";
      bisect = "";
      am = "ﯬ";
      am_or_rebase = "ﯬ or 咽";
      progress_divider = " of ";
    };

    git_status = {
      format = "([$all_status$ahead_behind]($style) )";
      conflicted = " ";
      ahead = " ";
      behind = " ";
      diverged = " ";
      untracked = " ";
      stashed = " ";
      modified = " ";
      staged = " ";
      renamed = " ";
      deleted = " ";
    };

    golang.symbol = " ";
  
    haskell.symbol = "λ ";

    hg_branch.symbol = " ";

    hostname.style = "bold green";

    java.symbol = " ";

    julia.symbol = " ";

    # Disable because it includes cached memory so memory is reported as full a lot
    memory_usage = {
      disabled = true;
      symbol = " ";
      threshold = 90;
    };

    nim.symbol = " ";

    nix_shell = {
      use_name = true;
      symbol = " ";
    };

    nodejs.symbol = " ";

    package.symbol = " ";

    perl.symbol = " ";

    php.symbol = " ";

    python.symbol = " ";

    ruby.symbol = " ";

    rust.symbol = " ";

    swift.symbol = "ﯣ ";

    time = {
      disabled = true;
      format = "%R";
    };

    username.style_user = "bold blue";
  };

























    };

}
