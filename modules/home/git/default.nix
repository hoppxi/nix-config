{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "hoppxi";
    userEmail = "hoppxii@gmail.com";

    signing = {
      key = null;
      signByDefault = true;
    };

    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      lg = "log --graph --oneline --decorate --all";
    };

    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      pull.rebase = true;
      push.autoSetupRemote = true;
      color.ui = true;
    };
  };
}
