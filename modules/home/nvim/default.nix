{ config, pkgs, ... }:

let
  configDir = ./config;
in {

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    withNodeJs = true;
    withPython3 = true;
    extraPackages = with pkgs; [ ripgrep fd unzip lua-language-server stylua ];
  };

  home.file.".config/nvim".source = configDir;

}
