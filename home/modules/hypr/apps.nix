# mod + key

let
  terminal = "alacritty";
in
[
  {
    key = "C";
    cmd = "${terminal}";
  }
  {
    key = "E";
    cmd = "${terminal} -e superfile";
  }
  {
    key = "Y";
    cmd = "spotify";
  }

  # editors
  {
    key = "V";
    cmd = "code";
  }
  {
    key = "N";
    cmd = "${terminal} -e nvim";
  }

  # Browser
  {
    key = "B";
    cmd = "notify-send -i browser 'Browse the web' 'Do not waste your time! pls.' && xdg-open https://www.google.com";
  }

  {
    key = "F";
    cmd = "fuzzel -T ${terminal}";
  }
  {
    key = "L";
    cmd = "pidof hyprlock || hyprlock";
  }
]
