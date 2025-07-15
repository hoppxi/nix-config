{

  tw = name: ''
    if [ ! -f /tmp/eww_toggle ]; then echo 0 > /tmp/eww_toggle; fi; n=$(cat /tmp/eww_toggle); if [ "$n" -eq 0 ]; then eww close-all && eww open ${name}; echo 1 > /tmp/eww_toggle; else eww close-all; echo 0 > /tmp/eww_toggle; fi
  '';
}
