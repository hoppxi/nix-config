{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nil
    nixfmt
    nixpkgs-fmt
    direnv

    python3
    pyright
    python313Packages.pip
    ruff

    nodejs_24
    nodePackages.typescript
    nodePackages.typescript-language-server

    go
    gopls
    gotools

    gcc
    clang-tools
    binutils
    gnumake
    cmake
    pkg-config

    vscode-langservers-extracted
    shfmt
    taplo
  ];
}
