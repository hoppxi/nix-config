{ pkgs, ... }:

{
  programs.anyrun = {
    enable = true;

    config = {
      x = {
        fraction = 0.50;
      };
      y = {
        fraction = 0.20;
      };
      width = {
        fraction = 0.40;
      };
      hideIcons = false;
      ignoreExclusiveZones = true;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = false;
      showResultsImmediately = true;
      maxEntries = 12;

      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
        "${pkgs.anyrun}/lib/libsymbols.so"
        "${pkgs.anyrun}/lib/librink.so"
        "${pkgs.anyrun}/lib/libshell.so"
        "${pkgs.anyrun}/lib/libtranslate.so"
        "${pkgs.anyrun}/lib/libdictionary.so"
        "${pkgs.anyrun}/lib/libwebsearch.so"
        "${pkgs.anyrun}/lib/libkidex.so"
        "${pkgs.anyrun}/lib/librandr.so"
        "${pkgs.anyrun}/lib/libnix_run.so"
        "${pkgs.anyrun}/lib/libniri_focus.so"
        "${pkgs.anyrun}/lib/libstdin.so"
      ];
    };

    extraCss = builtins.readFile ./style.css;
  };
}
