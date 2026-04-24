{ pkgs, ... }: {
  # Wir lassen diese Definitionen hier drin, falls du die home.nix 
  # mal separat nutzen willst. Die flake.nix überschreibt das im Zweifel.
  home.username = "phil";
  home.homeDirectory = "/Users/phil";
  home.stateVersion = "24.11";

  # Pakete für dein M4 MacBook Air
  home.packages = with pkgs; [
    python3
    uv           # High-speed Python package manager (perfekt für M4)
    swiftlint    # Für deine Swift-Entwicklung
    git          # Falls nicht schon im System
    neovim       # Ein vernünftiger Editor für die Shell
  ];

  # Zsh Konfiguration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      # Hilfreiche Aliase für deinen neuen Workflow
      nixswitch = "sudo darwin-rebuild switch --flake ~/.config/nix-config#polarstern";
      nixconfig = "cd ~/.config/nix-config && nvim";
      nixclean = "sudo nix-collect-garbage -d";
    };

    # Verhindert, dass macOS die .zshrc überschreibt
    initExtra = ''
      # Hier kannst du später manuellen Zsh-Code einfügen
    '';
  };

  # Git Identität
  programs.git = {
    enable = true;
    userName = "Phil Serafin";
    userEmail = "philserafin@icloud.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  # SSH Management für deine neuen Keys
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  # Direnv: Lädt Python-Umgebungen automatisch beim Betreten eines Ordners
  #programs.direnv = {
  #  enable = true;
  #  nix-direnv.enable = true;
  #};
}
