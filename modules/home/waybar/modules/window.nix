{
  programs.waybar.settings = [
    {
      "hyprland/window" = {
        "swap-icon-label" = false;
        "format" = "{}";
        "tooltip" = false;
        "min-length" = 5;

        "rewrite" = {
          "" = "<span foreground='#89b4fa'> </span> Hyprland";
          "~" = "  Terminal";
          "zsh" = "  Terminal";
          "kitty" = "  Terminal";
          "tmux(.*)" = "<span foreground='#a6e3a1'> </span> Tmux";


          "(.*)Brave" = "<span foreground='#f38ba8'>󰈹 </span> Firefox";
          "(.*) — Brave" = "<span foreground='#f38ba8'>󰈹 </span> $1";


          "(.*) - Visual Studio Code" = "<span foreground='#89b4fa'>󰨞 </span> $1";
          "(.*)Visual Studio Code" = "<span foreground='#89b4fa'>󰨞 </span> Visual Studio Code";

          "nvim" = "<span foreground='#a6e3a1'> </span> Neovim";
          "nvim (.*)" = "<span foreground='#a6e3a1'> </span> $1";

          "(.*)Spotify" = "<span foreground='#a6e3a1'> </span> Spotify";
          "(.*)Spotify Premium" = "<span foreground='#a6e3a1'> </span> Spotify Premium";

          "VLC media player" = "<span foreground='#fab387'>󰕼 </span> VLC Media Player";
          "(.*) - VLC media player" = "<span foreground='#fab387'>󰕼 </span> $1";

          "(.*) - mpv" = "<span foreground='#cba6f7'> </span> $1";

          "(.*).jpg" = "󰋩  $1.jpg";
          "(.*).png" = "󰋩  $1.png";
          "(.*).svg" = "󰋩  $1.svg";

          "vesktop" = "<span foreground='#89b4fa'> </span> Discord";

          "ONLYOFFICE Desktop Editors" = "<span foreground='#f38ba8'> </span> OnlyOffice Desktop";

          "(.*).docx" = "<span foreground='#89b4fa'>󰈭 </span> $1.docx";
          "(.*).xlsx" = "<span foreground='#a6e3a1'>󰈜 </span> $1.xlsx";
          "(.*).pptx" = "<span foreground='#fab387'>󰈨 </span> $1.pptx";
          "(.*).pdf" = "<span foreground='#f38ba8'> </span> $1.pdf";

        };
      };
    }
  ];
}