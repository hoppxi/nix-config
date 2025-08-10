{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  services = {
    dbus.enable = true;
    seatd.enable = true;

    displayManager.gdm = {
      enable = true;
      wayland = true;
      settings = {
        greeter = {
          Include = "hoppxi";
          Exclude = "bin,root,daemon,adm,lp,sync,shutdown,halt,mail,news,uucp,operator,nobody,nobody4,noaccess,postgres,pvm,rpm,nfsnobody,pcap";
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    hyprland
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
  ];
}
