{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Rust
    rustc
    cargo
    rust-analyzer

    # Python
    python3
    python3Packages.pip
    pyright

    # JavaScript / TypeScript
    nodejs_20
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.prettier
    nodePackages.eslint

    # Go
    go

    # C/C++
    gcc
    gdb

    # Formatters
    nixpkgs-fmt
    prettier         # JS/TS formatter
    pyright          # Python LSP
    gopls            # Go LSP
    lua-language-server
    vscode-langservers-extracted # HTML/CSS/JSON LSPs
    nixfmt-rfc-style

    nil
  ];
}
