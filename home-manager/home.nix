# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # You can also split up your configuration and import pieces of it here:
    ./modules/hyprland.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "marin";
    homeDirectory = "/home/marin";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [ 
    helix
    ripgrep
    starship
    wev
    discord
     # programs
    wofi
    swww
    waybar
    mako
    pipewire
    wireplumber
    pavucontrol
    bluez
    blueman
    
    alacritty
    firefox
    steam
    steam-run
    vlc
    xclip
    stremio
    cider
    blender
    godot_4

    # dev
    cargo
    rustc
    rust-analyzer    
    bun
    typescript
    nodePackages_latest.typescript-language-server
    gcc
    go
    nil
    docker
    git
    github-copilot-cli
    gh

    # utils
    diskonaut
    bat
    lutris
    wine
    unzip

    openmw
  ];


  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # helix
  programs.helix = {
    enable = true;
    # custom settings
    settings = {
      theme = "rose_pine";
      editor = {
        line-number = "relative";
        bufferline = "multiple";
      };
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      window = {
        padding = {
          x = 8;
          y = 4;
        };
        opacity = 1.0;
        decorations = "none";
      };
      colors= {
        primary = {
          background = "0x24292f";
          foreground = "0xffffff";
        };
        normal = {
          black = "0x24292e";
          red = "0xd73a49";
          green = "0x28a745";
          yellow = "0xdbab09";
          blue = "0x0366d6";
          magenta = "0x5a32a3";
          cyan = "0x0598bc";
          white = "0x6a737d";
        };
        bright = {
          black = "0x959da5";
          red = "0xcb2431";
          green = "0x22863a";
          yellow = "0xb08800";
          blue = "0x005cc5";
          magenta = "0x5a32a3";
          cyan = "0x3192aa";
          white = "0xd1d5da";
        };
      };
      font = {
        family = "Scientifica";
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # zshrcExtra = ''
    #   eval "$(starship init zsh)"
    # '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      cfg = "hx /etc/nixos/configuration.nix";
      cfg-rebuild = "cd /etc/nixos && sudo nixos-rebuild switch --flake .#nixos";
    	cat = "bat --theme=GitHub";
    	ls = "eza";    
		};
  };

    # Enable home-manager and git
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "marinbrochoire";
    userEmail = "marinbrochoire@protonmail.com";
    extraConfig = {
      push = { autoSetupRemote = true; };
    };
  };


  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
