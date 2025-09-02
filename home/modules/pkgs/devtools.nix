{ pkgs, ... }:

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
