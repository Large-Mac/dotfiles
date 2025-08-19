;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'acme)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;(setq fancy-splash-image "~/Downloads/ohm.png")

;; Change the localleader key to comma
(setq doom-localleader-key ",")

(setq doom-font (font-spec :family "Iosevka Comfy Wide" :size 15))

(custom-set-faces!
  '(org-level-1 :height 1.4 :weight bold :family "Iosevka Comfy Wide")
  '(org-level-2 :height 1.3 :weight semi-bold)
  '(org-level-3 :height 1.2 :weight medium)
  '(org-level-4 :height 1.1 :weight normal))

(after! org
  (setenv "PATH" (concat (getenv "PATH") ":/usr/bin"))
  (setq exec-path (append exec-path '("/usr/bin")))

  (setq org-preview-latex-default-process 'dvisvgm)

  (setq org-preview-latex-process-alist
        '((dvisvgm
           :programs ("latex" "dvisvgm")
           :description "dvi > svg"
           :message "you need to install the programs: latex and dvisvgm."
           :use-xcolor t
           :image-input-type "dvi"
           :image-output-type "svg"
           :image-size-adjust (1.0 . 1.0)
           :latex-compiler ("latex -interaction nonstopmode -output-directory %o %f")
           :image-converter ("dvisvgm --no-fonts --exact -o %B.svg %B.dvi"))))

  (setq org-format-latex-options
        (plist-put org-format-latex-options :scale 1.5))
  (setq org-startup-with-latex-preview t))

;; Set org-roam directory
(after! org-roam
  (setq org-roam-directory "~/org/roam/")  ; Set your preferred directory path
  (setq org-roam-db-location "~/org/roam/org-roam.db")  ; Set database location

  ;; Set default capture templates
  (setq org-roam-capture-templates
        '(("d" "default" plain
           "%?"
           :target (file+head"%<%Y%m%d%H%M%S>-${slug}.org"
                             "#+title: ${title}\n")
           :unnarrowed t)
          ("r" "reference" plain
           "%?"
           :target (file+head "references/${slug}.org"
                             "#+title: ${title}\n")
           :unnarrowed t)))

  ;; Set auto-sync
  (setq org-roam-db-autosync-mode t)

  ;; Set node display template
  (setq org-roam-node-display-template
        (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag))))

;; Configure org-download (separate from org-roam configuration)
(use-package! org-download
  :after org
  :config
  (setq-default org-download-method 'directory
                org-download-image-dir "images"
                org-download-heading-lvl nil
                org-download-screenshot-method "flameshot gui --raw > %s"
                org-download-screenshot-file (expand-file-name "screenshot.png" temporary-file-directory))

  ;; Add drag-and-drop support
  (add-hook 'dired-mode-hook 'org-download-enable))

;; Keybindings for org-download
(map! :map org-mode-map
      :leader
      (:prefix ("i" . "insert")
       :desc "Screenshot" "s" #'org-download-screenshot
       :desc "Clipboard image" "p" #'org-download-clipboard))

;; Markdown section
(use-package! markdown-mode
  :config
  (setq markdown-hide-markup t
        markdown-fontify-code-blocks-natively t
        markdown-header-scaling t
        markdown-make-gfm-checkboxes-buttons t))

  (setq-local markdown-hide-markup t)

;; CLEAN APPROACH: One direct configuration for both style and symbols
(after! markdown-mode
  ;; Set header faces with colored backgrounds

(custom-set-faces!
 '(markdown-header-face-1 :height 1.8 :weight bold :foreground "#2E5266" :background "#F8FAFB")
 '(markdown-header-face-2 :height 1.6 :weight bold :foreground "#8B4513" :background "#FDF9F5")
 '(markdown-header-face-3 :height 1.4 :weight bold :foreground "#556B2F" :background "#F7F9F4")
 '(markdown-header-face-4 :height 1.2 :weight bold :foreground "#8B0000" :background "#FDF6F6")
 '(markdown-header-face-5 :height 1.1 :weight bold :foreground "#483D8B" :background "#F6F6FD")
 '(markdown-header-face-6 :height 1.0 :weight bold :foreground "#2F4F4F" :background "#F6F8F8"))

  ;; Direct setup for header symbols
  (font-lock-add-keywords
   'markdown-mode
   '(("^\\(#\\) " 1 '(face nil display "◉ "))
     ("^\\(##\\) " 1 '(face nil display "○ "))
     ("^\\(###\\) " 1 '(face nil display "✸ "))
     ("^\\(####\\) " 1 '(face nil display "✿ "))
     ("^\\(#####\\) " 1 '(face nil display "⚘ "))
     ("^\\(######\\) " 1 '(face nil display "❀ ")))
   t))

  ;; Add symbol replacements for markdown list markers
  (font-lock-add-keywords
   'markdown-mode
   '(("^\\(\\s-*\\)\\(-\\) " 2 '(face nil display "➤"))     ;; Replace "-" with "➤"
     ("^\\(\\s-*\\)\\(\\+\\) " 2 '(face nil display "●"))    ;; Replace "+" with "◆"
     ("^\\(\\s-*\\)\\(\\*\\) " 2 '(face nil display "✦"))    ;; Replace "*" with "✦"
     ;; For nested lists (with spaces/tabs before the marker)
     ("^\\(\\s-+\\)\\(-\\) " 2 '(face nil display "▹"))     ;; Nested "-" becomes "▹"
     ("^\\(\\s-+\\)\\(\\+\\) " 2 '(face nil display "◉"))    ;; Nested "+" becomes "◈"
     ("^\\(\\s-+\\)\\(\\*\\) " 2 '(face nil display "✧")))   ;; Nested "*" becomes "✧"
   t)

  (font-lock-add-keywords
   'markdown-mode
   '(("\\(\\[ \\]\\)" 1 '(face nil display "☐"))   ;; Unchecked box
     ("\\(\\[x\\]\\)" 1 '(face nil display "☑"))    ;; Checked box
     ("\\(\\[X\\]\\)" 1 '(face nil display "☑")))   ;; Checked box (capital X)
   t)

(use-package! denote
  :config
  ;; Set the location of your notes directory
  (setq denote-directory (expand-file-name "~/notes/"))

  ;; Optional settings
  (setq denote-known-keywords '("emacs" "programming" "notes" "research"))
  (setq denote-file-type 'markdown-yaml) ;; Options: 'markdown-yaml (default), 'markdown, 'org, 'text

  ;; Use human readable dates in filenames
  (setq denote-date-format nil) ;; Default is ISO format date

  ;; Integrate with Dired if you want
  (add-hook 'dired-mode-hook #'denote-dired-mode))

(map! :leader
      :prefix ("n d" . "denote")
      :desc "Create new note" "n" #'denote
      :desc "Create note with specific type" "t" #'denote-type
      :desc "Create note with date" "d" #'denote-date
      :desc "Find note" "f" #'denote-open-or-create
      :desc "Insert link" "l" #'denote-link
      :desc "Backlinks" "b" #'denote-backlinks
      :desc "Add keywords" "k" #'denote-keywords-add
      :desc "Remove keywords" "K" #'denote-keywords-remove
      :desc "Rename file" "r" #'denote-rename-file)
