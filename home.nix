{ config, pkgs, ... }: {
  home.username = "basanta";
  home.homeDirectory = "/home/basanta";
  home.stateVersion = "24.11";

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      v = "vim";
      nv = "nvim";
      nrs = "sudo nixos-rebuild switch";
      ".." = "cd ..";
      "..." = "cd ../..";

      shutdown = "sudo shutdown -h now 'Bye!'";

      # show open ports
      ports = "netstat -tulanp";

      # get memory/cpu information
      meminfo = "free -mlt";
      cpuinfo = "lscpu";

      # get top processes eating memory
      psmem = "ps auxf | sort -nr -k 4";
      psmem10 = "ps auxf | sort -nr -k 4 | head -10";

      # get top processes eating cpu
      pscpu = "ps auxf | sort -nr -k 3";
      pscpu10 = "ps auxf | sort -nr -k 3 | head -10";
    };

    initExtra = ''
      # ["∮" "∯" "≎"]
      export PS1='\[\e[1;36m\]\w\[\e[0m\] \[\e[1;32m\]\[\e[1m\]∮\[\e[0m\] '
    '';
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        decorations = "none";
        opacity = 0.9;
        padding = {
          x = 2;
          y = 2;
        };
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 9;
      };
    };
  };

  home.file.".config/i3".source = /home/basanta/dotnix/i3;

  home.packages = with pkgs; [
    # guis
    flameshot
    pcmanfm
    vlc

    # clis
    evans
    lazygit
    neovim
    tmux

    # utils
    curl
    gcc
    gnumake
    jq
    ripgrep
    tree
    tree
    wget
    xclip
    zip

    # programming
    go
    nodejs
  ];
}
