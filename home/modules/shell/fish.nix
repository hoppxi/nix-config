{
  programs.fish = {
    enable = true;

    shellAliases = {
      grep = "grep --color=auto";
      nrs = "sudo nixos-rebuild switch --flake ~/skyland#ea";
      hms = "home-manager switch --flake ~/skyland#$hoppxi@ea";
      hm = "home-manager";
      c = "clear";
      cat = "bat";
      ls = "eza --icons";
      ll = "eza -lah --icons";
      l = "eza -l --icons";
    };

    interactiveShellInit = ''
      # Set Fish prompt
      function fish_prompt
        set_color cyan
        echo -n (whoami)"@ea":"
        set_color green
        echo -n (prompt_pwd)
        set_color normal
        echo -n " > "
      end

      # Color config
      set -g fish_color_command blue
      set -g fish_color_param yellow
      set -g fish_color_error red
      set -g fish_color_search_match --background=blue

      # Fish welcome banner
      set fish_greeting "Welcome, @hoppxi!"

      # Enable syntax highlighting and autosuggestions
      set -U fish_color_autosuggestion 555
    '';
  };
}
