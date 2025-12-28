{ pkgs, ... }:
let
  browser = "brave-browser.desktop";
  file-manager = "org.gnome.Nautilus.desktop";
  image-viewer = "org.gnome.gThumb.desktop";
  video-player = "vlc.desktop";
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
