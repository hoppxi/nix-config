# laptop

{
  imports = [
    ./configuration.nix
    ./locale.nix
    ./hardware-configuration.nix
    ./users.nix
    ./shell.nix
    ./session.nix
    ./xdg.nix
    ../common
  ];
}
