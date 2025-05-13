{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Browsers
    # NOTE: Downloading browsers is not recommended, it takes up much more resources, just install it using your distro's package manager!
    #qutebrowser
    #firefox
    #brave

    # Dev
    git
    tmux

    # Terminal Applications
    fzf
    fd
    ripgrep
    yazi
    #yt-dlp

    # Fonts
    nerd-fonts.iosevka
    nerd-fonts.hack
    nerd-fonts.terminess-ttf
    nerd-fonts._3270
    nerd-fonts.fantasque-sans-mono 
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    iosevka-comfy.comfy-wide
    # aporetic # (commented out until it gets added into packages)
    # Cartograph CF

    # WM programs
    #xwallpaper
    #picom
    devour
    #pywal
    #

    # GUI Applications
    keepassxc
    zathura

    # Text-Rendering Software
    #asciidoc-full-with-plugins
    #asciidoctor-with-extensions
  ];
}
