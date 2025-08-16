{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Version Control
    git

    # Nix
    nil
    nixfmt-rfc-style
    nixpkgs-fmt
    alejandra
    direnv

    ## Lua
    luajit
    lua-language-server

    ## Python
    python3
    pyright

    ## JS / TS
    nodejs_20
    nodePackages.typescript
    nodePackages.typescript-language-server

    ## Go
    go
    gopls

    ## C/C++
    gcc
    binutils
    gnumake

    vscode-langservers-extracted
  ];
}
