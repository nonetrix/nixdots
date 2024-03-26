{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # A audio settings app in GTK
    pavucontrol
    # A web browser
    brave
    # Flash card program
    anki-bin
    # A unoffical YouTube client
    freetube
    # A PDF viewer
    zathura
    # A image viewer, currently disable due to CVEs
    imv
    # A video player
    mpv
    # A archive viewer, might replace
    libsForQt5.ark
    # A Minecraft client
    prismlauncher
    # A wallpaper deamon
    wpaperd
    # A screen recorder
    obs-studio
    # A art/image editing program
    krita
    # A music client
    spotify
    # A video editor
    kdenlive
    # A 3D modeling software with ROCm (Radeon Open Compute platform) support
    blender-hip
    # A Microsoft Office clone
    libreoffice
    # AI based video caption
    livecaptions
    # A basic Wayland compositor that can be nested in a already running one, fixes games being weird on Wayland or not liking multiple monitors
    gamescope
    # Screenshotting
    hyprshot
    # Can give game FPS etc.
    mangohud
    # A web brrowser
    firefox
    # A Epic Games client
    heroic
    # Controls RGB devices e.g. Razer
    openrgb
    # Screenshots but with nice annotations e.g. Text, drawing, bluring etc.
    satty
    # Also does screenshots I guess
    grim
    # Allows for basic selection on a screenshot
    slurp
    # A AI upscaler
    upscayl
    # Gives WiFi info in status bar
    networkmanagerapplet
    # A Discord client
    vesktop
    # Torrenting for the seveen seas
    qbittorrent
    # A private web browser
    tor-browser
    # A hex editor
    bless
    # Updates Valve Proton and allows for downloading of custom versions
    protonup-qt
    # Game engine editor
    godot_4
    # Allows for tweaks with Valve Proton e.g. Regedit
    protontricks
    # TODO: Replace with Yazi
    # a file browser
    libsForQt5.dolphin
    # Fixes video tumbnails in Dolphin
    libsForQt5.ffmpegthumbs
    # Fixes drives in Dolphin?
    libsForQt5.kio-extras
    # A color picker
    hyprpicker
    # Audio in system tray
    pasystray
    # Graphical Neovim client
    neovide
    # Terminal
    foot
  ];
}
