{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 3;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "kvm-intel" ];

  networking.hostName = "trans-rights";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Argentina/Buenos_Aires";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.UTF-8";
    LC_IDENTIFICATION = "es_AR.UTF-8";
    LC_MEASUREMENT = "es_AR.UTF-8";
    LC_MONETARY = "es_AR.UTF-8";
    LC_NAME = "es_AR.UTF-8";
    LC_NUMERIC = "es_AR.UTF-8";
    LC_PAPER = "es_AR.UTF-8";
    LC_TELEPHONE = "es_AR.UTF-8";
    LC_TIME = "es_AR.UTF-8";
  };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.defaultSession = "hyprland";

  services.xserver.videoDrivers = [ "intel" ];

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vulkan-loader
      vulkan-tools
    ];
    extraPackages32 = with pkgs; [
      vaapiIntel
      vulkan-loader
    ];
  };

  services.xserver.libinput.enable = true;
  security.pam.services.hyprland.enable = true;
  services.seatd.enable = true;
  services.udisks2.enable = true;
  security.polkit.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.franchesca = {
    isNormalUser = true;
    description = "Franchesca";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    useDefaultShell = true;
    packages = with pkgs; [];
  };

  programs.firefox.enable = true;
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  programs.hyprland.enable = true;

  programs.steam.enable = true;
  programs.steam.package = pkgs.steam.override {
    extraPkgs = pkgs: with pkgs; [ libglvnd ];
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.epson-escpr ];
  };

  virtualisation.libvirtd.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      font-awesome_6
      terminus_font
      terminus_font_ttf
      nerd-fonts.iosevka
    ];
  };

  environment.systemPackages = with pkgs; [
    hyfetch
    fastfetch
    micro-with-wl-clipboard
    kdePackages.sddm
    kdePackages.dolphin
    kitty
    waybar
    wofi
    gimp
    wl-clipboard
    grim
    slurp
    gcc15
    hyprpaper
    wlogout
    pavucontrol
    kdePackages.kio-extras
    kdePackages.kio-admin
    kdePackages.ark
    feh
    appimage-run
    git
    epson-escpr
    emacs-gtk
    udisks
    syslinux
    qemu_full
    transmission_4-gtk
    eza
    bat
    dunst
    gnome-disk-utility
    gv
    bash
    vesktop
    swaylock
    swayidle
    lxqt.lxqt-policykit
    dosbox
    hyprpicker
    libinput
    usbutils
    mc
    gnumake
    ncurses
    bash
    lutris
    unzip
    godot
    playerctl
    blender
    prismlauncher
    hplip
    hplipWithPlugin
    system-config-printer
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}
