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
      "lsp_snippets"
      "autoinsert"
      "copyfilelocation"
      "colorpreview"
      "snippets"
      "terminal"
      "su_save"
      "selectionhighlight"
      "indentguide"
      "indent_convert"
    ];

    fonts = {
      font = "FiraCodeNerdFont-Retina";
      codeFont = "FiraCodeNerdFontMono-Retina";
    };
  };
}
