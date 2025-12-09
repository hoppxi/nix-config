{
  pkgs,
  config,
  ...
}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion = {
      enable = true;
      strategy = [
        "history"
        "completion"
      ];
    };
    syntaxHighlighting.enable = true;
    autocd = true;
    historySubstringSearch.enable = true;

    history = {
      ignoreDups = true;
      save = 10000;
      share = true;
      path = "${config.home.homeDirectory}/.zsh_history";
    };

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

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "z"
        "sudo"
        "colored-man-pages"
        "command-not-found"
      ];
    };

    initContent = ''
      # Load Powerlevel10k theme
      eval "$(starship init zsh)"

      # Bind history search
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down

      # Zsh autosuggestions color
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#777'

      # Enable auto-correction
      setopt CORRECT
      setopt AUTO_CD
      setopt MULTIOS
    '';
  };

}
