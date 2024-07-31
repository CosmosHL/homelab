{ ... }:

{
  imports = [
    ./homelab.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Helsinki";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "fi";
  };

  users.users.ozoku = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEF0CqpENoQj92TeNG2LGxB8yYdnF1DtHjmIQffzJ9nT"
    ];
  };

  services.openssh.enable = true;

  homelab.networking = {
    enable = true;
    subnet = "192.168.0";
    interface = "ens33";
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "24.05";
}