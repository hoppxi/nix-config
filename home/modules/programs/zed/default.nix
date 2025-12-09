{
  pkgs,
  ...
}:

{
  imports = [
    ./extensions.nix
    ./settings.nix
  ];

  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;

    mutableUserSettings = true;
    mutableUserDebug = true;
  };
}
