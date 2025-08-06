{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      nerd-fonts.jetbrains-mono
      inter
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Inter" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
}
