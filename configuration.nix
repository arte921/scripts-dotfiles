# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.extraModulePackages = with config.boot.kernelPackages;
    [
      (rtl8821ce.overrideAttrs (old: {
        version = "5.5.2_34066.20200325";
        src = pkgs.fetchFromGitHub {
          owner = "tomaspinho";
          repo = "rtl8821ce";
          rev = "69765eb288a8dfad3b055b906760b53e02ab1dea";
          sha256 = "17jiw25k74kv5lnvgycvj2g1n06hbrpjz6p4znk4a62g136rhn4s";
        };
      }))
    ];


  boot.kernelModules = [ "rtl8821ce" ];
  
  networking.hostName = "redstar"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  #networking.interfaces.enp27s0.useDHCP = true;
  
  services.mingetty.autologinUser = "arte";

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
  ];

  nixpkgs.config.allowUnfree = true;

   environment.systemPackages = with pkgs; [
    wget vim sway alacritty neofetch git godot bluez-alsa bluez bluez-tools networkmanager grim slurp wl-clipboard mesa radeontop htop libGL ntfs3g j4-dmenu-desktop brightnessctl xwayland brave pavucontrol steam discord lm_sensors micro vscode nano emacs bc chromium playerctl
   ];
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.bluetooth.enable = true;
  hardware.opengl.enable = true;

  hardware.pulseaudio = {
	enable = true;
	package = pkgs.pulseaudioFull;
  };

  users.users.arte = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

