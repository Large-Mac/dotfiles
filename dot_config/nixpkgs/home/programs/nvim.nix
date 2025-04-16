{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      gcc
      nodejs
      python3
      unzip
      tree-sitter
    ];
  };

}
