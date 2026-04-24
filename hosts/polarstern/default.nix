{ pkgs, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 6;
  system.primaryUser = "phil";

  users.users.phil = {
    name = "phil";
    home = "/Users/phil";
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    casks = [
      "iterm2"
      "whatsapp"
      "raycast"
      "orbstack"
      "postman"
      "firefox"
      "discord"
      "spotify"
      "visual-studio-code" 
      "vlc"
      "stats"
    ];
    masApps = {
      "Xcode" = 497799835;
    };
  };

  system.defaults = {
    dock = {
      autohide = true;
      tilesize = 48;
      persistent-apps = [
        "/Applications/Firefox.app"
        "/Applications/iTerm.app"
        "/Applications/Spotify.app"
        "/Applications/Discord.app"
        "/System/Applications/Mail.app"
      ];
      show-recents = false;
  };
    
    finder.AppleShowAllExtensions = true;
    finder.ShowPathbar = true;
    
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    
    NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.InitialKeyRepeat = 15;
    
    # Trackpad: Tippen statt Klicken
    trackpad.Clicking = true;

    controlcenter.BatteryShowPercentage = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  security.pam.services.sudo_local.touchIdAuth = true;
  nix.enable = false;
}