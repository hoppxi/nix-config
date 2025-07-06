{ config, pkgs, ... }:

{
  cpu = {
    format = " {usage}%";
    interval = 5;
  };
}
