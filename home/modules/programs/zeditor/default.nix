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

    mutableUserDebug = true;
  };
}
