{ pkgs, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  system.primaryUser = "phil";
  users.users.phil = {
    name = "phil";
    home = "/Users/phil";
  };

  # Homebrew Konfiguration
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    casks = [
      "iterm2"
      "whatsapp"
      "bitwarden"
    ];
    masApps = {
      "Xcode" = 497799835;
    };
  };

  system.defaults = {
    dock.autohide = true;
    finder.AppleShowAllExtensions = true;
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
  };
  
  security.pam.services.sudo_local.touchIdAuth = true;

 # nix.settings.experimental-features = "nix-command flakes";
 # nix.settings.auto-optimise-store = true;
  nix.enable = false;
}
