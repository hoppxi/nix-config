{ pkgs, ... }:

let
  miguelsolorio-fluent-icons = {
    name = "fluent-icons";
    publisher = "miguelsolorio";
    version = "0.0.19";
    sha256 = "17rplc681rjpskn9h7lk02349j57vqyp7d7q76c3z9cs8j3x5wrr";
  };
in
{
  programs.vscode.profiles.default.extensions =
    with pkgs.vscode-extensions;
    [
      # Formatter & Linters
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      jnoortheen.nix-ide
      # ms-python.python
      # rust-lang.rust-analyzer
      # ms-vscode.cpptools
      # ms-vscode.cmake-tools
      # llvm-vs-code-extensions.vscode-clangd
      # enkia.tokyo-night
      pkief.material-icon-theme
      # ritwickdey.liveserver
      # eamodio.gitlens
      sumneko.lua
    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # miguelsolorio-fluent-icons
    ];
}
