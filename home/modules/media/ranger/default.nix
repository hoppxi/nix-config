{
  programs.ranger = {
    enable = true;
    extraConfig = ''
      set preview_images true
      set preview_images_method ueberzug
      set draw_borders true
      set border_color #89b4fa
      set color_scheme tokyonight
    '';
  };

  home.file.".config/ranger/colorschemes/tokyonight.py".source = ./tokyonight.py;
}
