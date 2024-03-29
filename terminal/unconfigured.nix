{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Zips files
    zip
    # Unzips files
    unzip
    # Searches for files
    skim
    # Makes tree of files
    tree
    # SHows system stats e.g. CPU usage, memory usage
    btop
    # Shows GPU usage stats
    nvtopPackages.amd
    # Makes games go broom broom? Doesn't seem to have a effect, but why not?
    gamemode
    # Downloads things
    wget
    # Version control
    git
    # TODO: Likely don't need this with Pipewire, but works for now
    # Manages "alsa" audio
    alsa-utils
    # TODO: Somehow make this prioritize Spotify over anything else
    # Allows to pause and play media
    playerctl
    # TODO: I think this is duplicated, and it's already in a weird place
    dconf
    # Terminal music visualizer
    cava
    # Kills program based on name
    killall
    # Manages files in home directory e.g. Download, Documents, etc.
    xdg-user-dirs
    # I forgor
    usbutils
    # Neofetch but faster
    fastfetch
    # TODO: Either fix fastfetch and rice it, or switch back to Neofetch and rice it too
    neofetch
    # Cool Matrix effect
    unimatrix
    # Better ls command
    lsd
    # Better grep I guess? It's faster I hear, but only reason really
    ripgrep
    # Container manager
    distrobox
    # Various Vulkan tools for example for showing Vulkan version etc.
    #vulkan-tools
    # Anime upscaler
    #realesrgan-ncnn-vulkan
    # TODO: Find way to get Japanese subs
    # Anime from the seveen seas
    ani-cli
    # I forgor
    udisks
    # Manages trash, this program kinda sucks ass
    trashy
    # Formats Nix files
    alejandra
    # Interact with clipboard from commandline
    wl-clipboard
    # Calculator
    bc
    # Let's you see used disk space
    ncdu
    # Tor client, not to be confused with browser
    tor
    # TODO: Use this over Dolphin
    # Terminal file manager
    yazi
    # Hex viewer
    hexyl
    # YouTube downloader, also supports other sites like the hub ig if that's your thing
    yt-dlp
    # Converts videos and images
    ffmpeg
    # Allows downloading big git files
    git-lfs
    # Allows for ADB etc.
    android-tools
    # Allows doing stuff with 7z files
    p7zip
    # Lets you make notfications from Bash
    libnotify
    # Converts images and stuff
    imagemagick
    # Lets me open stuff etc.
    # TODO: For some reason xdg-open likes to ask me what to open files with despite the fact that it set, but it does seem to at least select the program in xdg settings by default just have to select it
    xdg-utils
    # Allows for you to control things relating to the TTY
    kbd
    # Allows extacting rar stuff
    unrar-wrapper
  ];
}
