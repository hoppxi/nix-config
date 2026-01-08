{ inputs, ... }:

{
  imports = [
    inputs.waul.homeModules.default
  ];

  services.waul = {
    enable = true;
    settings = {
      margin = "30 0 0 0";
      border-radius = "20 20 0 0";
      border-width = "1 -1 0 -1";
      border-color = "69 133 136 153";
      background-color = "40 40 40 153";
    };
  };
}
