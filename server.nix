{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "macpro";
  networking.networkmanager.enable = true;
  networking.useDHCP = false;

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  time.timeZone = "Europe/Amsterdam";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget vim neofetch git godot networkmanager minetest wine powershell zerotierone unzip zip blender openjdk8 neovim steamcmd tmux lynx elinks fish pkgs.pkgsi686Linux.gnutls nodejs
  ]; 
 
  services.zerotierone.enable = true;
  services.sshd.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
   "openssl-1.0.2u"
  ];

  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];

  users.users.arte = {
    isNormalUser = true;
  };

  hardware.opengl.driSupport32Bit = true;
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

