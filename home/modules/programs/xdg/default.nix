{ pkgs, ... }:
let
  browser = "brave-browser.desktop";
  file-manager = "yazi.desktop";
  image-viewer = "imv.desktop";
  video-player = "mpv.desktop";
in
{
  home = {
    packages = with pkgs; [
      xdg-utils
      xdg-user-dirs
    ];
  };

  xdg = {
    enable = true;

    mimeApps = rec {
      enable = true;

      associations.added = defaultApplications;
      defaultApplications = {
        "inode/directory" = file-manager;

        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "text/html" = browser;

        "image/png" = image-viewer;
        "image/jpeg" = image-viewer;
        "image/gif" = image-viewer;
        "image/svg+xml" = image-viewer;

        "video/mp4" = video-player;
        "video/ogg" = video-player;
      };
    };
  };
}
