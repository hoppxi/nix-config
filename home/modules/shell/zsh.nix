{
  pkgs,
  config,
  ...
}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

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
      source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"

      # Load user configuration if present
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

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
