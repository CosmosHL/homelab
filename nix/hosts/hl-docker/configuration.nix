{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../common/base.nix
  ];

  networking = {
    hostName = "hl1";

    interfaces.ens33 = {
      useDHCP = false;
      ipv4.addresses = [
        {
          address = "192.168.0.3";
          prefixLength = 24;
        }
      ];
    };

    defaultGateway.interface = "ens33";
  };

  virtualisation.docker.enable = true;

  system.stateVersion = "24.05";
}