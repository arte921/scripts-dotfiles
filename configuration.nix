{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8821ce ];
  
  networking.hostName = "redstar";
  networking.networkmanager.enable = true;
  networking.useDHCP = false;

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
  
  #services.mingetty.autologinUser = "arte";

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
    wget vim sway alacritty neofetch git godot bluez-alsa bluez bluez-tools networkmanager grim slurp wl-clipboard mesa radeontop htop libGL ntfs3g j4-dmenu-desktop brightnessctl xwayland brave pavucontrol steam discord lm_sensors micro vscode nano emacs bc chromium playerctl nodejs firefox spidermonkey minetest superTuxKart android-studio lutris imagemagick jetbrains.idea-community xfce.xfce4-whiskermenu-plugin wine winetricks powershell atom sublime3 xfce.xfce4-battery-plugin zerotierone pulseeffects gimp nmap google-chrome arandr kitty unzip zip gnome3.gnome-tweaks blender jdk11 sshfs transmission-gtk vlc gjs
  ];
   
   nixpkgs.config.permittedInsecurePackages = [
     "openssl-1.0.2u"
   ];  
   
  services.flatpak.enable = true;
  services.zerotierone.enable = true;
  xdg.portal.enable = true;
  services.blueman.enable = true;
  programs.adb.enable = true;

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
    extraGroups = [ "wheel" "adbusers" ];
  };

  hardware.opengl.driSupport32Bit = true;
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;

  services.xserver.displayManager.gdm.autoLogin.enable = true;
  services.xserver.displayManager.gdm.autoLogin.user = "arte";
  services.xserver.displayManager.defaultSession = "gnome";
  
  system.stateVersion = "20.03"; #no change
}

