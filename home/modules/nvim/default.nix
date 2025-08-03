{ pkgs, ... }:

let
  nvimScript = ./config;
  pluginPkgs = import ./packages.nix { inherit pkgs; };
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;

    extraPackages = with pkgs; [
      lua-language-server
      stylua
      rust-analyzer
      pyright
      gopls
      nil
      ripgrep
      fd
      unzip
    ];

    plugins = pluginPkgs;

    extraLuaConfig = ''
      dofile("${nvimScript}/init.lua")
    '';
  };

  xdg.configFile."nvim/lua".source = "${nvimScript}";
}
