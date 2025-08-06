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

    vscode-langservers-extracted
  ];
}
