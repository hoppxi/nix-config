{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Version Control
    git
    gh

    # Nix
    nil
    nixfmt-rfc-style
    nixpkgs-fmt
    alejandra
    direnv

    # Containers
    docker
    docker-compose

    ## Rust
    cargo
    rustc

    ## Python
    python3
    python3Packages.pip
    pyright

    ## JS / TS
    nodejs_20
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.prettier

    ## Go
    go
    gopls

    ## Lua
    lua
    lua-language-server

    ## C/C++
    gcc
    gnumake
    cmake
    gdb

    vscode-langservers-extracted
  ];
}
