{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Core
    git
    neovim
    
    python3
    uv
    ruff
    httpie
    nodejs_20
    swiftlint

    cmake
    gnumake
    ninja

    # Utilities
    gh
    jq
    tree
    btop
    pandoc
    fzf
    starship
    eza
    zoxide
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    package = pkgs.direnv.overrideAttrs (oldAttrs: {
      doCheck = false;
    });
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      nixswitch = "sudo darwin-rebuild switch --flake ~/.config/nix-config#polarstern";
      nixconfig = "cd ~/.config/nix-config && nvim";
      nixclean = "sudo nix-collect-garbage -d";
      ls = "eza --icons --git";
      lt = "eza --tree --level=2 --icons";
      cd = "z";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Phil Serafin";
        email = "philserafin@icloud.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        serverAliveInterval = 60;
      };
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}