{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -gx FISH_HISTORY fish
    '';
    interactiveShellInit = ''
      set -u FISH_HISTORY  # This unsets the variable if it exists
      set -g fish_history fish # This forces it to the valid string 'fish'
    '';
  };
}
