{ lib, ... }:

{
  services.displayManager.sddm.sugarCandyNix = {
    enable = true;
    settings = {
      Background = lib.cleanSource ../../assets/images/lockscreen.jpg;
      ScreenWidth = 1366;
      ScreenHeight = 768;
      FormPosition = "center";
      FullBlur = true;
      AccentColor = "#87CEEB";
      BackgroundColor = "##5CACEE";
      RoundCorners = 20;
      FontSize = "12";
    };
  };
}
