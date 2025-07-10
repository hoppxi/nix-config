{ lib, ... }:

{
  services.displayManager.sddm.sugarCandyNix = {
    enable = true;
    settings = {
      Background = lib.cleanSource ../../assets/wallpapers/wallpaper1.jpg;
      ScreenWidth = 1366;
      ScreenHeight = 768;
      FormPosition = "center";
      FullBlur = true;
      AccentColor = "#87CEEB";
      BackgroundColor = "#87CEEB";
      RoundCorners = 20;
      FontSize = "11";
    };
  };
}
