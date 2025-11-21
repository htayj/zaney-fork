{
  pkgs,
  inputs,
  ...
}:
{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    firefox.enable = true; # Firefox is not installed by default
    hyprland = {
      enable = true; # set this so desktop file is created
      withUWSM = false;
    };
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    adb.enable = true;
    hyprlock.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Hyprland systeminfo QT  (Optional)
    #inputs.hyprsysteminfo.packages.${pkgs.system}.default

    #aider-chat # AI in terminal (Optional: Client only)
    amfora # Fancy Terminal Browser For Gemini Protocol
    inputs.custompkgs.packages.${pkgs.system}.pc98ripper
    inputs.custompkgs.packages.${pkgs.system}.dectalk
    inputs.custompkgs.packages.${pkgs.system}.hxcfloppy
    #pc98ripper
    appimage-run # Needed For AppImage Support
    firefox # Main Browser
    chromium # Alt Browser
    brightnessctl # For Screen Brightness Control
    vial # keyboad editor
    makemkv # video disk backups
    mkvtoolnix # remux tool
    dvdbackup # alt disk backup tool for full VOB backups
    rclone # download tool
    vlc # disk playback
    emacs # primary text editor
    nil # lsp for nix files
    weechat # irc
    xsane # scanning
    naps2 # alt scanning
    tesseract5 # ocr
    imagemagickBig # image manipulation
    imv # minimal image viewer
    #hplip # hp printer/scanner drivers
    #irssi -- need to make a wrapper with these
    # libnotify
    # perl538Packages.Glib
    # perl540Packages.Glib
    # perl538Packages.HTMLParser
    # perl540Packages.HTMLParser
    #claude-code # Claude code terminal AI (Optional: Client only)
    cliphist # Clipboard manager using rofi menu
    cmatrix # Matrix Movie Effect In Terminal
    cowsay # Great Fun Terminal Program
    docker-compose # Allows Controlling Docker From A Single File
    duf # Utility For Viewing Disk Usage In Terminal
    dysk # Disk space util nice formattting
    eza # Beautiful ls Replacement
    ffmpeg # Terminal Video / Audio Editing
    file-roller # Archive Manager
    gedit # Simple Graphical Text Editor
    #gemini-cli # CLI AI client ONLY (optional)
    gimp # Great Photo Editor
    krita # digital illustration
    glxinfo # needed for inxi diag util
    greetd.tuigreet # The Login Manager (Sometimes Referred To As Display Manager)
    htop # Simple Terminal Based System Monitor
    hyprpicker # Color Picker
    hyprshot # Screen capture
    wev
    hdrop # dropdown terminal
    eog # For Image Viewing
    inxi # CLI System Information Tool
    killall # For Killing All Instances Of Programs
    libnotify # For Notifications
    lm_sensors # Used For Getting Hardware Temps
    lolcat # Add Colors To Your Terminal Command Output
    base16-schemes # color schemes for stylx
    yj # yaml->json
    yq # yaml query shell util
    jq # json query shell util
    xq # xml query shell util
    slack # modern professional chat
    irssi # irc
    lshw # Detailed Hardware Information
    mpv # Incredible Video Player
    ncdu # Disk Usage Analyzer With Ncurses Interface
    nixfmt-rfc-style # Nix Formatter
    nwg-displays # configure monitor configs via GUI
    onefetch # provides zsaneyos build info on current system
    neofetch # alt fetch program
    pavucontrol # For Editing Audio Levels & Devices
    pciutils # Collection Of Tools For Inspecting PCI Devices
    picard # For Changing Music Metadata & Getting Cover Art
    pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
    playerctl # Allows Changing Media Volume Through Scripts
    rhythmbox # audio player
    ripgrep # Improved Grep
    socat # Needed For Screenshots
    signal-desktop # encrypted chat
    vesktop # discord
    screen # main terminal multiplexer
    unrar # Tool For Handling .rar Files
    unzip # Tool For Handling .zip Files
    usbutils # Good Tools For USB Devices
    uwsm # Universal Wayland Session Manager (optional must be enabled)
    v4l-utils # Used For Things Like OBS Virtual Camera
    waypaper # Change wallpaper
    wget # Tool For Fetching Files With Links
    ytmdl # Tool For Downloading Audio From YouTube
    np2kai # pc98 emulator
  ];
}
