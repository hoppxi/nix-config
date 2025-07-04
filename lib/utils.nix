{ lib, ... }:

{
  mkIfHost = host: module: lib.mkIf (builtins.currentSystem == host) module;

  mkOverlay = f: prev: f prev;
}
