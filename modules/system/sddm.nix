{ config, pkgs, ... }:

{
  systemd.tmpfiles.rules = [
    "d /usr/share/sddm/themes/sugar-candy 0755 root root -"
  ];

  system.activationScripts.sddmTheme = {
    text = ''
      if [ ! -d /usr/share/sddm/themes/sugar-candy ]; then
        mkdir -p /usr/share/sddm/themes/sugar-candy
        cd /tmp
        rm -rf sugar-candy
        git clone --depth=1 https://github.com/Kangie/sddm-sugar-candy sugar-candy
        cp -r sugar-candy/* /usr/share/sddm/themes/sugar-candy
      fi
    '';
  };

  services.displayManager.sddm.theme = "sugar-candy";
}