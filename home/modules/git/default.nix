{
  programs.git = {
    enable = true;

    userName = "hoppxi";
    userEmail = "hoppxii@gmail.com";

    extraConfig = {
      core = {
        editor = "nvim";
        excludesfile = "~/.gitignore_global";
      };
      color = {
        ui = "auto";
      };
      diff = {
        algorithm = "patience";
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
      };
    };

    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      lg = "log --oneline --graph --decorate";
      bra = "branch -a";
      pushm = "push origin main";
    };

    signing = {
      key = null;
      signByDefault = true;
    };

    lfs.enable = true;

    includes = [
      { path = "~/.gitconfig.local"; }
      { path = "~/.gitconfig.work"; }
      { path = "~/.gitconfig.personal"; }
    ];

  };

  home.sessionVariables = {
    GIT_EDITOR = "nvim";
    GIT_TERMINAL_PROMPT = "1";
    DOCKER_HOST = "unix:///var/run/docker.sock";
  };

}
