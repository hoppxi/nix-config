{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -gx FISH_HISTORY fish
    '';
    interactiveShellInit = ''
      set -u FISH_HISTORY
      set -g fish_history fish
    '';
  };
}
