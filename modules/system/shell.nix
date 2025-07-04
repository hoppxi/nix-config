{ pkgs, ... }:

{
  programs.zsh.enable = true;

  environment.shells = with pkgs; [ 
    zsh 
    bash 
  ];

  environment.variables = {
    EDITOR = "nvim";
  };
}
