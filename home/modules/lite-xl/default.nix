{ inputs, ... }:
{
  
  imports = [
    inputs.nix-xl.homeModules.nix-xl
  ];
  
  programs.lite-xl = {
    enable = true;
    plugins.languages.enableList = [ 
      "nix" 
      "yaml" 
      "json" 
      "ts" 
      "tsx"
      "ini"
      "sh" 
      "go"
      "sass"
   ];
    plugins.enableList = [ 
      "bracketmatch" 
      "editorconfig" 
      "gitdiff_highlight" 
      "treeview-extender" 
      "lsp"
    ];

    fonts.font = "FiraCodeNerdFont-Retina";
    fonts.codeFont = "FiraCodeNerdFontMono-Retina";
  };
}
