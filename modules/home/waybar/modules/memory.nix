{ config, pkgs, lib, ... }:

{
  memory = {
    format = " {used:0.1f}G";
    interval = 10;
  };
}
