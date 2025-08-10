{
  imports = [
    ./wrapper.nix
  ];

  services.wrHypridle = {
    enable = true;
    events = [
      {
        event = "dim";
        timeout = 120;
      }
      {
        event = "lock";
        timeout = 300;
      }
      {
        event = "suspend";
        timeout = 1800;
      }
    ];
  };
}
