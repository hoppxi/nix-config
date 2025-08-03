{ pkgs, ... }:

let
  zen-browser =
    import
      (builtins.fetchTarball {
        url = "https://github.com/youwen5/zen-browser-flake/archive/master.tar.gz";
        sha256 = "01lmp5vvh3bx8yfls43czrf76fs1qn90276v7niqdsrmnrrncflj";
      })
      {
        inherit pkgs;
      };

in
{
  home.packages = [
    zen-browser.default
    pkgs.brave
    pkgs.w3m
  ];
}
