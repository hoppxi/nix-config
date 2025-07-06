{ pkgs, username, hostname, ... }:

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
      path = "/home/${username}/.zsh_history";
    };

    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      l = "ls -lah";
      grep = "grep --color=auto";
      update = "sudo nixos-rebuild switch --flake ~/nix-config#${hostname}";
      hm = "home-manager switch --flake ~/nix-config#${username}@${hostname}";
      c = "clear";
      cat = "bat";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "z"
        "sudo"
        "command-not-found"
        "colored-man-pages"
      ];
      theme = "robbyrussell";
    };

    # Let p10k override Oh My Zsh's theme
    initContent = ''
      # Use Powerlevel10k
      if [[ -r "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme" ]]; then
        source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"
      fi

      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      # History substring search
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down

      # Zsh autosuggestions color fix
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555'
    '';
  };
}
