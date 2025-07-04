{ ... }: 

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      format = "$directory$git_branch$character";
    };
  };
}
