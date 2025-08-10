{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      inter
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [ "Inter" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
}
