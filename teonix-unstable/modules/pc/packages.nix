{ config, pkgs, stable-pkgs, ... }:

let
  customRetroarch = pkgs.retroarch.override {
    cores = with pkgs.libretro; [
      snes9x
      beetle-psx-hw
      desmume
      mesen
      fceumm
      pcsx2
      dolphin
    ];
  };
in

#let
#  pythonPackages = pkgsUnstable.python3Packages;
#in

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    ####################
    # System Utilities #
    ####################
    fira-code-nerdfont  # Font
    zsh                 # Shell
    git                 # Version control
    pciutils            # PCI device listing utilities
    ffmpeg              # Multimedia framework
    socat               # Multipurpose relay
    bat                 # Cat command replacement
    ripgrep             # Line-oriented search tool
    lshw                # Hardware listing
    pkg-config          # Tool to configure compiler and linker flags
    meson               # Build system
    ninja               # Build system
    #xwayland
    xwaylandvideobridge

    libva
    vulkan-loader
    

    #######################
    # Development Tools   #
    #######################
    appimage-run         # Run AppImages
    yad                  # Dialog boxes from shell scripts
    playerctl            # Media player control
    nixfmt-rfc-style     # Nix code formatting
    docker-compose       # Docker utility
    docker               # Docker itself

    #######################
    # Monitoring & Power  #
    #######################
    powertop             # Power consumption tool
    lm_sensors           # Hardware monitoring
    btop                 # Resource monitoring tool
    inxi                 # System information script
    pavucontrol          # PulseAudio volume control

    ########################
    # Virtualization Tools #
    ########################
    qemu                 # Virtualization tool
    libvirt              # Virtualization management
    virt-manager         # Virtual machine manager
    virt-viewer          # Virtual machine viewer
    bridge-utils         # Network bridge utilities
    dnsmasq              # DNS forwarding and DHCP services

    ###################
    # Theming & Fonts #
    ###################
    apple-cursor         # Mac-like cursor
    font-awesome         # Icon font
    whitesur-gtk-theme   # GTK theme
    whitesur-icon-theme  # Icon theme
    pywal                # Color scheme generator
    material-icons       # Material design icons
    hyprpaper            # Wallpaper tool

    ##################
    # Wayland Tools  #
    ##################
    wl-clipboard         # Wayland clipboard tool
    swaynotificationcenter # Notification center for sway
    grim                 # Screenshot tool for Wayland
    slurp                # Select a region for screenshots in Wayland
    
    waybar               # Status bar for Wayland
    wofi                 # Application launcher for Wayland
    wofi-emoji           # Emoji picker for Wayland
    sway                 # Wayland compositor
    swaybg               # Background utility for sway

    ################
    # Gaming Tools #
    ################
    #bottles              # Wine and Proton GUI
    protonup             # Proton updater
    openra               # Open source real-time strategy games
    heroic               # Game launcher
    lutris               # Gaming platform for Linux
    dolphin-emu          # GameCube/Wii emulator
    
    ####################
    # Media & Graphics #
    ####################
    mpv                 # Media player
    gimp                # Image editing
    imv                 # Image viewer
    spotify             # Spotify client
    spotify-tray        # Tray control for Spotify
    moonlight-qt        # Game streaming client
    protontricks        # Tools for Proton gaming
    mangohud            # Gaming performance overlay
    space-cadet-pinball # Classic pinball game

    ####################
    # Miscellaneous    #
    ####################
    #quickemu            # Quickly create and run virtual machines
    
        stress              # CPU stress testing tool
    whitesur-icon-theme # Mac-like icon theme
    moonlight-qt        # Game streaming client
    heroic              # Game launcher
    winetricks           # Wine helper tool
    # support both 32- and 64-bit applications
    wineWowPackages.stable

    # support 32-bit only
    wine

    # support 64-bit only
    (wine.override { wineBuild = "wine64"; })

    # support 64-bit only
    wine64

    # wine-staging (version with experimental features)
    wineWowPackages.staging

    # winetricks (all versions)
    winetricks

    # native wayland support (unstable)
    wineWowPackages.waylandFull

    (python3.withPackages (subpkgs: with subpkgs; [
        requests
    ]))

    free42              # Calculator app
    mangohud            # Gaming performance overlay
    prismlauncher       # Minecraft launcher
    mediawriter         # Fedora Media Writer
    piper               # Configure gaming mice
    customRetroarch     # Fixed RetroArch override
    wl-clipboard         # Wayland clipboard tools
    hyprpicker           # Color picker
    brightnessctl       # Adjust screen brightness
    tree                # Directory tree visualization
    neovide             # Neovim GUI client
    unrar               # Unrar utility
    htop                # Interactive process viewer
    killall             # Kill processes
    eza                 # Modern replacement for `ls`
    cmatrix             # Matrix effect in the terminal
    unzip               # Unzip utility
    ncdu                # Disk usage analyzer
    jq                  # JSON processor
    duf                 # Disk usage utility
    swappy              # Screenshot annotation tool
    mousam              # Mouse control app
    lolcat              # Rainbow coloring for terminal output
   
   #(wineWowPackages.full.override {
   #   wineRelease = "staging";
   #   mingwSupport = true;
   # })

    #python311
    #python311Packages.requests

    wireplumber
    wget
    noto-fonts
    corectrl
    blueman
    wgnord
    vscodium
    gnome-tweaks
    gnome-software
    gnome-extension-manager
    neofetch
    vesktop
    kitty
    gammastep
    gimp
    networkmanagerapplet
    nemo
    zoom-us
    signal-desktop
    scli
    cava
    pfetch
    youtube-music
    obsidian
    amdgpu_top
    qemu
    libvirt
    virt-manager
    virt-viewer
    bridge-utils
    dnsmasq
    powertop
    docker-compose
    fira-code-nerdfont
    zsh
    apple-cursor
    wl-clipboard
    pciutils
    ffmpeg
    socat
    cowsay
    ripgrep
    lshw
    bat
    pkg-config
    meson
    hyprpicker
    brightnessctl
    swappy
    appimage-run
    yad
    inxi
    playerctl
    nixfmt-rfc-style
    swww
    grim
    slurp
    swaynotificationcenter
    imv
    mpv
    pavucontrol
    tree
    neovide
    greetd.tuigreet
    killall
    eza
    cmatrix
    lolcat
    htop
    lxqt.lxqt-policykit
    lm_sensors
    unzip
    unrar
    libnotify
    v4l-utils
    ydotool
    duf
    ncdu
    jq
    spotify
    spotify-tray
    wofi
    rofi
    wofi-emoji
    waybar
    hyprpaper
    font-awesome
    wlogout
    nwg-look
    pywal
    material-icons
    distrobox
    quickemu
    firefox-esr
    stress
    btop
    piper
    whitesur-gtk-theme
    whitesur-icon-theme
    mangohud
    protonup
    #bottles
    protontricks
    openra
    prismlauncher
    mediawriter
    free42
    moonlight-qt
    heroic
    space-cadet-pinball
    mousam
    dolphin-emu
    fuse3
    zip
    brave
    chromium
    google-chrome
    hypridle             # Idle management for Hyprland
    hyprlock             # Lock screen tool for Hyprland
    swww                 # Wallpaper management for sway and Hyprland
    stremio
    libsForQt5.qtstyleplugin-kvantum
    themechanger
    polkit_gnome
    p7zip
    file

    # build tools
    ninja
    libgcc
    vcpkg
    gnumake
    cmakeMinimal
    scrcpy
    notion


    libglvnd
    steam-run
    nix-ld
    samba
    qmmp
    clementine
    yt-dlp

    
  ] ++ (with stable-pkgs; [
    mesa
    
    #python3.withPackages (ps: with ps; [ requests ]) # Python 3.10 with requests package
  ]);
}
