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
  
  networking.hostName = "redstar";
  networking.networkmanager.enable = true;
  networking.useDHCP = false;

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
  
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
    wget vim sway alacritty neofetch git godot bluez-alsa bluez bluez-tools networkmanager grim slurp wl-clipboard mesa radeontop htop libGL ntfs3g j4-dmenu-desktop brightnessctl xwayland brave pavucontrol steam discord lm_sensors micro vscode nano emacs bc chromium playerctl nodejs firefox spidermonkey minetest superTuxKart android-studio lutris imagemagick jetbrains.idea-community xfce.xfce4-whiskermenu-plugin wine winetricks powershell atom sublime3 xfce.xfce4-battery-plugin zerotierone pulseeffects kdeconnect gimp nmap google-chrome
   ];
   
   nixpkgs.config.permittedInsecurePackages = [
     "openssl-1.0.2u"
   ];  
   
  services.flatpak.enable = true;
  services.zerotierone.enable = true;
  xdg.portal.enable = true;
  services.blueman.enable = true;
  programs.adb.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];

  sound.enable = true;
  hardware.bluetooth.enable = true;
  hardware.opengl.enable = true;

  hardware.pulseaudio = {
	enable = true;
	package = pkgs.pulseaudioFull;
  };

  users.users.arte = {
    isNormalUser = true;
    extraGroups = [ "wheel" "adbusers" ]; # Enable ‘sudo’ for the user.
  };

  hardware.opengl.driSupport32Bit = true;
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome3.enable = true;
  
  services.xserver.displayManager.gdm.autoLogin.enable = true;
  services.xserver.displayManager.gdm.autoLogin.user = "arte";

  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.displayManager.defaultSession = "xfce";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

