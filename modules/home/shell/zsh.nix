{ pkgs, ... }: 

{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh.enable = true;
    ohMyZsh.theme = "agnoster";
    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      update = "sudo nixos-rebuild switch --flake ~/nix-config#nixos";
      hupdate = "home-manager switch --flake ~/nix-config#hoppxi@nixos";
    };
  };
}
