{ config, pkgs, ... }:

{
  home.username = "colin";
  home.homeDirectory = "/home/colin";

  home.stateVersion = "23.11";  # Use current stable Nix version

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neovim
    lazygit
    git
    gcc
    ripgrep-all
    fd
    fzf
    eza
    bat
    unzip
    curl
    wget
  ];

  programs.git = {
    enable = true;
    userName = "Your Name";
    userEmail = "you@github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Symlink your GitHub dotfiles
  home.file.".config/nvim".source = ../.config/nvim;
  home.file.".bashrc".source = ../.bashrc;
  home.file.".gitconfig".source = ../.gitconfig;

  # Any fonts or ghostty specific configs
  fonts.fontconfig.enable = true;
}
