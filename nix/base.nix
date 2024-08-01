{ pkgs, ... }:

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

    hashedPassword = "$6$nGrNZImY5jW423Uz$rUOWUPPdyBLNDJfYcfX1lc2ApD5e193BKg.aY282zrBECxu/K47/h7.iJ9I9LLEAl3ugMqWfhQA.6hPs236vG0";

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEF0CqpENoQj92TeNG2LGxB8yYdnF1DtHjmIQffzJ9nT ozoku@COSMOS"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICYi6cycQXiyWUfzccxVx7vWsU6erITNXxcvxxncoJup ozoku@titan"
    ];
  };

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
    dig
  ];

  homelab.networking = {
    enable = true;
    subnet = "192.168.20";
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
