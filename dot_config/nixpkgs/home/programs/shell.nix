{
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        update = "home-manager switch --flake .#neo";
        doom = "~/.config/emacs/bin/doom";
        yta = "yt-dlp -f 'ba' -x --embed-thumbnail --output '%(title)s.%(ext)s'";
        ytv = "yt-dlp -f 'bestvideo+bestaudio/best' --output '%(title)s.%(ext)s'";
    };
    initExtra = ''
        export PATH="$HOME/scripts:$PATH"
        update-colors
      '';
  };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
