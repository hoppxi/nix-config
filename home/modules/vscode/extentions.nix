{ pkgs, ... }:

let

  eww-yuck-yuck = {
    name = "yuck";
    publisher = "eww-yuck";
    version = "0.0.3";
    sha256 = "1hxdxa13s1vlilw7fidr8vnl19c9wjazjvnvmqgl4fsswwny110c";
  };

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
      ms-python.python
      rust-lang.rust-analyzer
      # ms-vscode.cpptools
      ms-vscode.cmake-tools
      llvm-vs-code-extensions.vscode-clangd
      enkia.tokyo-night
      pkief.material-icon-theme
      ritwickdey.liveserver
      eamodio.gitlens

    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      eww-yuck-yuck
      miguelsolorio-fluent-icons
    ];
}
