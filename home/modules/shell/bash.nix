{
  pkgs,
  config,
  ...
}:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [
      "ignoredups"
      "ignorespace"
    ];
    historyFile = "${config.home.homeDirectory}/.bash_history";
    historySize = 10000;

    shellAliases = {
      grep = "grep --color=auto";
      nrs = "sudo nixos-rebuild switch --flake ~/skyland#ea";
      hms = "home-manager switch --flake ~/nix-config#hoppxi@ea";
      hm = "home-manager";
      c = "clear";
      cat = "bat";
      ls = "eza --icons";
      ll = "eza -lah --icons";
      l = "eza -l --icons";
    };

    initExtra = ''
      # Enable color support
      export CLICOLOR=1
      export LS_COLORS="di=34:fi=0:ln=35"

      # Enable programmable completion features
      if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
      fi
    '';
  };
}
