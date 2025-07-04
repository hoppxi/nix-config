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
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.prettier
    nodePackages.eslint

    # Go
    go
    gopls

    # C/C++
    gcc
    gdb
    clang
    clang-tools_16  # Includes clangd (LSP)

    # Formatters
    nixpkgs-fmt
    prettier         # JS/TS formatter
    pyright          # Python LSP
    gopls            # Go LSP
    lua-language-server
    typescript-language-server
    vscode-langservers-extracted # HTML/CSS/JSON LSPs

  ];
}
