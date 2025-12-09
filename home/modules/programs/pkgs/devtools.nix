{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    # Nix
    nil
    nixfmt-rfc-style
    nixpkgs-fmt
    direnv

    ## Python
    python3
    pyright
    python313Packages.pip

    ## JS / TS
    nodejs_24
    nodePackages.typescript
    nodePackages.typescript-language-server

    ## Go
    go
    gopls
    gotools

    ## C/C++
    gcc
    binutils
    gnumake
    cmake
    pkg-config

    # Database
    # mongodb
    # mariadb
    # postgresql
    # redis

    # others
    vscode-langservers-extracted
  ];
}
