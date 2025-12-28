{
  pkgs,
  config,
  ...
}:

{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake ~/nix-config#ea";
      hms = "home-manager switch --flake ~/nix-config#hoppxi@ea";
      hm = "home-manager";
      nde = "nix develop";
      ndv = "nix develop -c $SHELL";
      ns = "nix search nixpkgs";

      ga = "git add";
      gaa = "git add --all";
      gc = "git commit -v";
      gcm = "git commit -m";
      gcam = "git commit -a -m";
      gca = "git commit --amend";

      gco = "git checkout";
      gcb = "git checkout -b";
      gb = "git branch";
      gba = "git branch -a";
      gbd = "git branch -d";

      gs = "git status";
      gd = "git diff";
      gl = "git log --oneline --graph --decorate";
      gp = "git push";
      gpf = "git push --force-with-lease";
      gu = "git pull";
      gf = "git fetch";
      grh = "git reset --hard";
    };

    shellAliases = {
      grep = "grep --color=auto";
      ip = "ip --color=auto";

      cat = "bat";
      ls = "eza --icons";
      ll = "eza -lah --icons";
      l = "eza -l --icons";

      c = "clear";
      rg = "rg --hidden";
      rgi = "rg -i";
      psg = "ps aux | grep -i";
      untar = "tar -xvf";
      tgz = "tar -xvzf";
      rmf = "rm -rf";
      md = "mkdir -p";
    };

    interactiveShellInit = ''
      set -u FISH_HISTORY  # This unsets the variable if it exists
      set -g fish_history fish # This forces it to the valid string 'fish'

      set -g fish_greeting "" 

      set -gx CLICOLOR 1
      set -gx EDITOR hx

      set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border"
    '';

    functions = {
      fcd = ''
        set -l dir (find . -maxdepth 3 -type d | fzf)
        if test -n "$dir"
            cd "$dir"
        end
      '';

      __auto_ls_after_cd = {
        description = "ls after cd";
        onVariable = "PWD";
        body = "ls";
      };
    };
  };

  home.sessionVariables = {
    FISH_HISTORY = "fish";
  };

}
