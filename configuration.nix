# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      /home/octopiansociety/Source/libraries/musnix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;
    version = 2;
    useOSProber = true;
    efiSupport = true;
    # efiInstallAsRemovable = true;
    devices = [ "nodev" ]; # or "nodev" for efi only
    extraEntries = ''
      menuentry "Windows 10" {
        insmod part_gpt
        insmod chain
        set root='(hd1,gpt3)'
        chainloader /EFI/Microsoft/Boot/bootmgfw.efi
      }
    '';
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.networkmanager.enable = true;

  environment.enableDebugInfo = true;
  nixpkgs.config.packageOverrides = pkgs: {
    llvm = pkgs.llvm.overrideAttrs (attrs: {
        separateDebugInfo = true;
        });
      };

  environment.systemPackages = with pkgs; [
    wget
    file
    fzf
    cquery
    ccls
    networkmanager
    firefox
    # skypeforlinux # -> busted on latest right now :(
    git
    nasm
    thunderbird
    jre
    parted
    unetbootin
    (import ./vim.nix)
    vimPlugins.vim-plug
    nix-prefetch-git
    powerline-fonts
    gdb
    valgrind
    gnome3.nemiver
    qtcreator
    dos2unix
    python37
    bear
    xorg.libX11
    nodejs
    playonlinux
    llvm
    gnuplot
    clang
    gcc
  ];

  nixpkgs.config.firefox.enableBrowserpass = true; 
  nixpkgs.config.firefox.enableGnomeExtensions = true; 

  # Enable Nvidia proprietary drivers 
  services.xserver.videoDrivers = [ "nvidia" ];  

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages = with pkgs; [ pkgs.pkgsi686Linux.libva ]; # steam support

  # Gnome 3
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = false;
  services.xserver.desktopManager.gnome3.enable = true;

  #new tabs in gnome terminal open in same directory
  environment.interactiveShellInit = ''
    if [[ "$VTE_VERSION" > 3405 ]]; then
      source "${pkgs.gnome3.vte}/etc/profile.d/vte.sh"
    fi
  '';

  # real-time audio nix configuration
  musnix.enable = true;

  users.users.octopiansociety = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ];
    packages = [
      # pkgs.steam
      # pkgs.steam-run
      # pkgs.steam-run-native
      # pkgs.linux-steam-integration
      pkgs.pkgsi686Linux.libva
      pkgs.spotify
      # pkgs.wine
      # pkgs.wineFull
      pkgs.qjackctl
      pkgs.jack2Full
      pkgs.portaudio
      pkgs.filezilla
      pkgs.latex2html
      pkgs.texlive.combined.scheme-full 
      pkgs.gimp
      pkgs.ifuse
      pkgs.p7zip
      pkgs.audacity
      pkgs.ardour
      pkgs.killall
    ];
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}
