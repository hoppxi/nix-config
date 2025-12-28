let
  uname = "hoppxi";
in
{
  imports = [
    ./modules/desktop/hypr
    ./modules/programs
    ./modules/services
    ./modules/shell
    ./modules/theme
  ];

  home = {
    username = uname;
    homeDirectory = "/home/${uname}";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
