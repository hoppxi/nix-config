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
    historyFile = "${config.home.homeDirectory}/.config/bash/.bash_history";
    historySize = 10000;

    shellAliases = {
      grep = "grep --color=auto";
      nrs = "sudo nixos-rebuild switch --flake ~/nix-config#ea";
      hms = "home-manager switch --flake ~/nix-config#hoppxi@ea";
      hm = "home-manager";
      c = "clear";
      cat = "bat";
      ls = "eza --icons";
      ll = "eza -lah --icons";
      l = "eza -l --icons";
      rg = "rg --hidden";
      rgi = "rg -i";
      nde = "nix develop";
      ndv = "nix develop -c $SHELL";
      ns = "nix search nixpkgs";
      df = "df -h";
      du = "du -h";
      psg = "ps aux | grep -i";
      ip = "ip --color=auto";
      v = "nvim";
      vi = "nvim";
      untar = "tar -xvf";
      tgz = "tar -xvzf";
      zipf = "zip -r";
      unzipf = "unzip";
      md = "mkdir -p";
      rmf = "rm -rf";
      cpv = "cp -v";
      mvv = "mv -v";
      cpd = "cp -r";
    };

    initExtra = ''
      export CLICOLOR=1
      export LS_COLORS="di=34:fi=0:ln=35"
    '';
  };

  home.packages = with pkgs; [
    bash-completion
  ];
}
