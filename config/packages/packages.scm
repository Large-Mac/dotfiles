(use-modules (guix profiles)
             (gnu packages))

;; Loading machines.scm from systems directory.
(load (string-append (getenv "HOME") "/dotfiles/config/systems/machines.scm"))

(define system-packages
  '("zoxide"      ;; cd alternative
    "eza"     ;; ls alternative
    "openssh"
    "kitty"
    "curl"
    "wget"
    "fzf" ;; fuzzy finder
    "bat" ;; cat alternative
    "ripgrep" ;; grep alternative
    "fd" ;; find alternative
    "btop" ;; htop alternative
    "zathura" ;; document viewer
    "vim" ;; as a backup for nvim and emacs
    "git" ;; version control
    ;;"firefox" ;; default browser
    ;;"nyxt"
    "qutebrowser"
    "librewolf" ;; libre firefox
    "yt-dlp" ;; video downloader
    ;; dotfile manager, choose between chezmoi, gnu stow, and more
    "pipewire"	;; audio service
    ;;"btrbk"	;; BTRFS backup tool
    "transmission"	;; torrent client, has an emacs package as well
    "keepassxc"	;; password manager
    "mpv"	;; music player
    "sxhkd"	;; simple x hotkey daemon
    ))

(define dev-packages
  '("gcc-toolchain" 	;; GNU Compiler Collection
    "make"	;; GNU Make
    "llvm"	;; compiler infrastructure
    "clang"	;; C family frontend for LLVM
    "docker"	;; containers
    "podman"	;; rootless and headless containers
    "emacs"	;; The holy editor
    "neovim"	;; The evil editor
    ))

(define emacs-packages
  '("xclip"
    "shellcheck"
    "cmake"
    "pandoc"
    "flameshot"
    "graphviz"
    "node"
    "beets"
    "ispell"
    "texlive-base" ;; LaTex distrobution
    "texlive-latex-base"
    "texlive-amsfonts"
    "texlive-latex-amsmath"
    "texlive-latex-preview"
    "texlive-dvipng"
    "dvisvgm"
    ))


(define virtualization-packages
  '("qemu"
    "virt-manager"
    "libvirt"
    "bridge-utils"))

(define fonts
  '("font-hack"
    "font-iosevka"
    ))

(define laptop-packages
  '("thinkfan"	;; fan-speed controller
    "network-manager"	;; GUI network manager
    ))

(define desktop-packages
  '("hello"	;; Placeholder for Nvidia Drivers
    ))

;; Choose machine-specific packages
(define machine-specific-packages
  (cond
    (laptop? laptop-packages)
    (desktop? desktop-packages)
    (else '())))

;; Combine everything into the main manifest
(concatenate-manifests
 (list
  ;; Core system packages - always installed
  (specifications->manifest
   (append system-packages
           dev-packages
           emacs-packages
           virtualization-packages
           fonts))

  
  ;; Machine specific packages
  (specifications->manifest machine-specific-packages)))
