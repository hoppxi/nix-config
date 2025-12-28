{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    nil
    nixfmt-rfc-style
    nixpkgs-fmt
    direnv

    python3
    pyright
    python313Packages.pip

    nodejs_24
    nodePackages.typescript
    nodePackages.typescript-language-server

    go
    gopls
    gotools

    gcc
    binutils
    gnumake
    cmake
    pkg-config

    vscode-langservers-extracted
  ];
}
