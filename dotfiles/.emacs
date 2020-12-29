;; *Sadie's custom emacs configuration*
;; Updated 23.12.20

;; ---------------------------------------------------------------------------
;; Basic setup
;; ---------------------------------------------------------------------------
(setq user-full-name "Sadie Bartholomew")
(setq current-language-environment "English")

;; ---------------------------------------------------------------------------
;; Specify load path to use
;; ---------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; LIST OF EMACS PACKAGES / LISP LIBRARIES REQUIRED BY THIS CONFIGURATION
;; COVERING BOTH THE (require 'PACKAGE) AND THE FULL CHAIN OF DEPENDENCIES.
;; THEY MUST ALL BE PLACED AS APPROPRIATELY-NAMED .el FILES UNDER THE ABOVE:
;;
;; * direct package requires:
;;   * 'e2wm' for an (optional, press F6) windowing solution;
;;   * 'awesome-tab' for a buffer tabbing system;
;;   * 'hideshowvis' for foldable regions in applicable major modes;
;;   * 'fill-column-indicator' for fixed reference lines e.g. at column 80;
;;   * 'col-highlight' for highlighting the column of the cursor's position;
;;   * 'stickyfunc-enhance' for a header stating the current function;
;;   * 'todotxt-mode', a major mode for todo.txt (syntax highlighting etc.);
;;   * 'indent-guide' for indentation guidelines on certain modes.
;;   * 'mood-line' for a clean, minimal mode line to replace the default one;
;;   * 'git-gutter' to indicate line changes, additions and removals on branch;
;;   * 'visible-mark' to highlight the current and former position of the mark.
;;
;; * indirect package requires:
;;   * 'vline', required by 'col-highlight';
;;   * 'window-layout' required by 'e2wm'.

;; ---------------------------------------------------------------------------
;; Define a colour scheme (sadie-colourscheme) used throughout
;; ---------------------------------------------------------------------------
(setq sadie-colourscheme-offblack "#0A0F14")
(setq sadie-colourscheme-offwhite "#E5E5FF")
(setq sadie-colourscheme-duckegg "#8FBCB5")
(setq sadie-colourscheme-midblue "#3980C6")
(setq sadie-colourscheme-darkblue "#00264D")
(setq sadie-colourscheme-otherteal "#004B66")
(setq sadie-colourscheme-darkteal "#00384D")
(setq sadie-colourscheme-maroon "#33000D")
(setq sadie-colourscheme-red "#D22D2D")
(setq sadie-colourscheme-yellow "#FFDF80")
(setq sadie-colourscheme-green "#00B386")

;; ---------------------------------------------------------------------------
;; Customise basic properties of frames, windows and buffers
;; ---------------------------------------------------------------------------

;; Don't show the startup screen
(setq inhibit-startup-screen t)

;; Hide all ugly toolbars
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Default window frame dimensions
;; * want width size slightly over 79 general max, but need to account for line
;;   numbering (up to 5 digits) and git gutter (up to 1) spaces, so use 86
;; * height size, about half a standard screen height
(add-to-list 'default-frame-alist '(width . 86))
(add-to-list 'default-frame-alist '(height . 35))

;; Amend window frame titles to give full path of file opened
(setq frame-title-format
      `((:eval buffer-file-name "%f" "%b")))

;; ---------------------------------------------------------------------------
;; Backups, diffs and the clipboard
;; ---------------------------------------------------------------------------

;; Put all emacs backup files in an '~/.emacs-saves' directory:
(setq backup-directory-alist '(("." . "~/.emacs-saves/"))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; Default to unified diffs
(setq diff-switches "-u")

;; So that copy/paste can be transferred outside of emacs.
(setq x-select-enable-clipboard t)

;; ---------------------------------------------------------------------------
;; Built-in general configuration
;; ---------------------------------------------------------------------------

;; Enable font lock mode for all modes supporting it (fontify)
(global-font-lock-mode 1)

;; Set indentation to always use space, not tabs:
(progn (setq-default indent-tabs-mode nil))

;; Always end a file with a newline. Note: switch off temporarily if
;; need to keep state of no final line on a file (for diffs etc.)
(setq require-final-newline 'query)

;; ---------------------------------------------------------------------------
;; Customise look excluding colour customisation
;; ---------------------------------------------------------------------------

;; Display line numbers in the editor on the LHS.
(global-linum-mode t)

;; Change default font and size of text.
;; NOTE: this uses a custom font which must be installed on the system.
;; TTF for the given font available via: https://github.com/be5invis/Iosevka
(add-to-list 'bdf-directory-list "~/.local/share/fonts")
(set-frame-font "Iosevka SS02 Medium 12" nil t)

;; Cursor type
(setq-default cursor-type 'box)

;; Highlight the (cursor's) current row i.e. line:
(global-hl-line-mode 1)
(set-face-foreground 'highlight nil)

;; ---------------------------------------------------------------------------
;; External package mode configuration
;; ---------------------------------------------------------------------------

;; Add new todo.txt mode for todo.txt based organisation:
(require 'todotxt-mode)
(add-to-list 'auto-mode-alist '("\\todo.txt\\'" . todotxt-mode))

;; e2wm windowing management
(require 'e2wm)

;; awesome-tab for a buffer tabbing system
(require 'awesome-tab)
(awesome-tab-mode t)
(setq awesome-tab-style "box")
(setq awesome-tab-height 150)

;; col-highlight to highlight the (cursor's) current column:
;;(require 'crosshairs)
(require 'col-highlight)
(column-highlight-mode 1)

;; hideshow to enable hiding of code blocks of appropriate major modes:
(require 'hideshowvis)
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
(add-hook 'python-mode-hook 'hs-minor-mode)
(autoload 'hideshowvis-minor-mode
   "hideshowvis"
   "Will indicate regions foldable with hideshow in the fringe."
   'interactive)
(dolist (hook (list 'emacs-lisp-mode-hook
                    'c++-mode-hook
                    'python-mode-hook
              ))
 (add-hook hook 'hideshowvis-enable)
)
(hideshowvis-symbols)

;; fill-column-indicator for a fixed column mark at line 79
(require 'fill-column-indicator)
(setq fci-rule-column 79)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)
(setq fci-rule-width 2)

;; stickyfunc-enhance for a header line with current function signature, shown
;; only when the signature is scrolled out of the current buffer view:
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(semantic-mode 1)
(require 'stickyfunc-enhance)

;; indent-guide for guidelines on indentation
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation-mode)
(add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)

;; git gutter for git chagesets
(require 'git-gutter)
(global-git-gutter-mode t)
(custom-set-variables
 '(git-gutter:update-interval 2))
(custom-set-variables
 '(git-gutter:unchanged-sign "."))

;; ---------------------------------------------------------------------------
;; Customise colours
;; ---------------------------------------------------------------------------

;; Global face customisation, notably of colours
(custom-set-faces
 '(default ((t
             (
              :background "#0A0F14"
              :foreground "#8FBCB5"
             )
 )))
 '(font-lock-builtin-face (((
                             (class color)
                             (min-colors 88)
                             (background dark)
                            )
                            (:foreground "#00B386")
                          ))
  )
 '(font-lock-comment-face (((
                             (class color)
                             (min-colors 88)
                             (background dark)
                            )
                            (:foreground "#004B66")
                          ))
  )
 '(font-lock-constant-face (((
                              (class color)
                              (min-colors 88)
                              (background dark)
                             )
                             (:foreground "#FFDF80")
                           ))
  )
 '(font-lock-function-name-face (((
                                   (class color)
                                   (min-colors 88)
                                   (background dark)
                                  )
                                  (:foreground "#33859D")
                                ))
  )
 '(font-lock-keyword-face (((
                             (class color)
                             (min-colors 88)
                             (background dark)
                            )
                            (:foreground "#D22D2D")
                          ))
  )
 '(font-lock-string-face (((
                            (class color)
                            (min-colors 88)
                            (background dark)
                           )
                           (:foreground "#3980C6")
                         ))
  )
 '(font-lock-type-face (((
                          (class color)
                          (min-colors 88)
                          (background dark)
                         )
                         (:foreground "#33859D")
                       ))
  )
  '(font-lock-variable-name-face (((
                                    (class color)
                                    (min-colors 88)
                                    (background dark)
                                   )
                                   (:foreground "#E5E5FF")
                                 ))
   )
 '(info-title-3 ((t (:inherit info-title-4 :foreground "#E5E5FF" :height 1.2))))
 '(info-title-4 ((t (:inherit info-title-4 :foreground "#00384D"))))
 '(mode-line ((t
               (:background "#00384D"
                :foreground "#8FBCB5"
                :box (:line-width 2 :color "#3980C6")
                :weight ultra-bold
                :family "Iosevka SS02 Medium 12"
               )
             ))
  )
)

;; Mode line customisation including of colours
(setq-default mode-line-format
  (list
    mode-line-front-space
    '(:eval (propertize (concat "\t[" mode-name "] %l:%i\t")
             'face
             '(:foreground "#0A0F14" :height 0.8 :weight normal)
             'help-echo (buffer-file-name)
            )
     )
    '(:eval (propertize (file-name-directory buffer-file-name)
             'face
             'info-title-4
             'help-echo (buffer-file-name)
            )
     )
    '(:eval (propertize (file-name-nondirectory buffer-file-name)
             'face
             'info-title-3
             'help-echo (buffer-file-name)
            )
     )
  )
)

;; Cursor colour
(set-cursor-color (symbol-value 'sadie-colourscheme-offwhite))

;; Current row and column (see col-highlight package) highlighted colour
(set-face-background 'hl-line (symbol-value 'sadie-colourscheme-darkblue))
(set-face-background 'col-highlight (symbol-value 'sadie-colourscheme-maroon))


;; Line numbering colours
(set-face-foreground 'linum (symbol-value 'sadie-colourscheme-duckegg))
(set-face-background 'linum (symbol-value 'sadie-colourscheme-darkteal))

;; Minibuffer colours
(set-face-foreground 'minibuffer-prompt
                     (symbol-value 'sadie-colourscheme-yellow))
(set-face-background 'minibuffer-prompt (symbol-value 'sadie-colourscheme-red))
(add-hook 'minibuffer-setup-hook
  (lambda ()
    (make-local-variable 'face-remapping-alist)
    (add-to-list 'face-remapping-alist
                 '(default (:background "#D22D2D" :foreground "#FFDF80")))
  )
)

;; Highlight region colour:
(set-face-attribute 'region nil :background
  (symbol-value 'sadie-colourscheme-offwhite)
)

;; Git VCS changeset colours (see git-gutter)
(set-face-background 'git-gutter:unchanged
                     (symbol-value 'sadie-colourscheme-offblack))
(set-face-foreground 'git-gutter:unchanged
                     (symbol-value 'sadie-colourscheme-darkteal))
(set-face-foreground 'git-gutter:modified
                     (symbol-value 'sadie-colourscheme-yellow))
(set-face-foreground 'git-gutter:added
                     (symbol-value 'sadie-colourscheme-green))
(set-face-foreground 'git-gutter:deleted
                     (symbol-value 'sadie-colourscheme-red))

;; Colour of column mark at line 79 (see fill-column-indicator)
(setq fci-rule-color (symbol-value 'sadie-colourscheme-darkteal))

;; indent-guide colours
(set-face-background 'highlight-indentation-face
                     "#001B25"
)
(set-face-background 'highlight-indentation-current-column-face
                     (symbol-value 'sadie-colourscheme-darkteal)
)

(defface visible-mark-active
  '((((type tty) (class mono)))
    (t (:background "#00B386"))) "")
(defface visible-mark-face1
  '((((type tty) (class mono)))
    (t (:background "#004d39"))) "")

;; ---------------------------------------------------------------------------
;; External package mode config. (any that must come after colour config.)
;; ---------------------------------------------------------------------------

;; mood-line for improved, though minimalistic, mode line
(require 'mood-line)
(mood-line-mode)

;; visible-mark to highlight the current and former position of the mark
(require 'visible-mark)
(global-visible-mark-mode 1)
(setq visible-mark-max 1)
(setq visible-mark-faces `(visible-mark-face1))

;; ---------------------------------------------------------------------------
;; New and amended key bindings
;; ---------------------------------------------------------------------------

;; Set non-package-specific custom keybindings
(global-set-key [f4] 'goto-line)

;; Ket stroke to switch into e2wm window system
(global-set-key [f6] 'e2wm:start-management)

;; 'hideshow' package key binding mappings
(setq hs-minor-mode-map
(let ((map (make-sparse-keymap)))
  ;; These bindings roughly imitate those used by Outline mode.
  (define-key map (kbd "C-c h C-b") 'hs-hide-block)
  (define-key map (kbd "C-c s C-b") 'hs-show-block)
  (define-key map (kbd "C-c h C-a") 'hs-hide-all)
  (define-key map (kbd "C-c s C-a") 'hs-show-all)
  (define-key map (kbd "C-c h C-l") 'hs-hide-level)
map))
