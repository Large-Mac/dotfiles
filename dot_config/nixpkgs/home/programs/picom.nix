 {
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;

    # Fading
    fade = true;
    fadeDelta = 10;

    # Opacity
    activeOpacity = 1.0;
    inactiveOpacity = 0.95;

    # Performance settings
    settings = {
      unredir-if-possible = true;
      focus-exclude = [
        "class_g = 'dmenu'"
      ];
    };
  };
} 
