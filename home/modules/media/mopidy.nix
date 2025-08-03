{ pkgs, ... }:

{
  services.mopidy = {
    enable = true;

    extensionPackages = with pkgs; [
      mopidy-local
      mopidy-mpd
      mopidy-mpris
    ];
    settings = {
      file = {
        media_dirs = [ "$XDG_MUSIC_DIR|Music" ];
        follow_symlinks = true;
      };
      local = {
        enabled = true;
        media_dir = "/home/hoppxi/Music";
        excluded_file_extensions = [
          ".html"
          ".zip"
        ];
      };

      mpd = {
        enabled = true;
        port = 6600;
        # default_playlist_scheme = "m3u";
      };
      mpris = {
        enabled = true;
      };
    };
  };

}
