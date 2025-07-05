{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      update = "sudo nixos-rebuild switch --flake ~/nix-config#nixos";
      hupdate = "home-manager switch --flake ~/nix-config#hoppxi@nixos";
    };
    initContent = ''
      # Enable Powerlevel10k theme
      if [[ -r "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme" ]]; then
        source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"
      fi

      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };
}
