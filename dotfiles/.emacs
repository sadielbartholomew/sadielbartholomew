;; *Sadie's custom emacs configuration*
;; Updated 06.04.21

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
;;   * 'nlinum' for line numbering since in-built linum is laggy on big files;
;;     -> assuming may not have access to Emacs 26 on some machines therefore
;;        can't use 'display-line-numbers-mode' introduced in v.26 instead.
;;   * 'e2wm' for an (optional, press F6) windowing solution;
;;   * 'awesome-tab' for a buffer tabbing system;
;;   * 'hideshowvis' for foldable regions in applicable major modes;
;;   * 'fill-column-indicator' for fixed reference lines e.g. at column 80;
;;   * 'col-highlight' for highlighting the column of the cursor's position;
;;   * 'stickyfunc-enhance' for a header stating the current function;
;;   * 'indent-guide' for indentation guidelines on certain modes;
;;   * 'mood-line' for a clean, minimal mode line to replace the default one;
;;   * 'visible-mark' to highlight the current and former position of the mark;
;;   * 'org-bullets', for replacing org-mode bullets with UTF-8 characters;
;;   * 'yaml-mode', a mode for YAML;
;;   * 'hlinum', highlights current line number for Emacs <26.
;;
;; * indirect package requires:
;;   * 'vline', required by 'col-highlight';
;;   * 'window-layout' required by 'e2wm'.

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
;;   numbers (<=5 digits) and other fringe elements (1) spaces, so use 86.
;; * height size, about half a standard screen height
(add-to-list 'default-frame-alist '(width . 86))
(add-to-list 'default-frame-alist '(height . 35))

;; Amend window frame titles to give full path of file opened
(setq frame-title-format
      `((:eval buffer-file-name "%f" "%b")))

;; Update buffers to state of file on disk when there are no unsaved changes
(global-auto-revert-mode t)

;; ---------------------------------------------------------------------------
;; Set the colour scheme (ocean-chroma, my own creation!)
;; ---------------------------------------------------------------------------
;; Global colour customisation. Note 'ocean-chroma-theme.el', available from:
;;   https://github.com/sadielbartholomew/ocean-chroma-theme
;; must be added to the directory below for successful loading of the theme.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'ocean-chroma t)

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

;; Manage poor performance of line numbering (slows emacs for large files)
(defun disablelinenumbering ()
  (interactive)
  (message "Turned off line numbering")
  (global-linum-mode 0)
  (nlinum-mode -1)
  (linum-mode 0)
)

; Disable line numbering via either linum or nlinum when...
(add-hook 'org-mode-hook 'disablelinenumbering)  ; ...always for org mode
(global-set-key (kbd "<f6>") 'disablelinenumbering)  ; ...use F6 shortcut
;; ... if file exceeds 3000 lines, when it starts to seriously slow emacs
(add-hook
 'prog-mode-hook
 (lambda () (if (or (> (buffer-size) (* 3000 80))
                    (> (line-number-at-pos (point-max)) 3000))
                (disablelinenumbering))))

;; Don't disable commands to convert text to upper and lower case
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; ---------------------------------------------------------------------------
;; Customise fonts
;; ---------------------------------------------------------------------------

;; Change default font and size of text.
;; NOTE: this relies on custom fonts which must be installed on the system.
;; TTFs for the given fonts available via: https://github.com/be5invis/Iosevka
;; (fixed-) and https://www.ctan.org/tex-archive/fonts/cm/ (variable-pitch)
(set-frame-font "Iosevka SS02 Medium 12" nil t)
;; Use different fonts for code (fixed-) and for freehand text (variable-pitch)
(add-to-list 'bdf-directory-list "~/.local/share/fonts")
  (custom-theme-set-faces
   'user
   '(fixed-pitch ((t (:family "Iosevka SS02 Medium" :weight normal))))
   '(variable-pitch ((t (:family "CMU Sans Serif" :weight bold))))
 )

;; ---------------------------------------------------------------------------
;; Customise look further to colour customisation by theme and fonts
;; ---------------------------------------------------------------------------

;; Display line numbers in the editor on the LHS: this applies to Emacs 26+,
;; see 'nlinum' config below to handle line numbering on earlier versions.
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; Cursor type
(setq-default cursor-type 'box)

;; Highlight the (cursor's) current row i.e. line:
(global-hl-line-mode 1)

(setq custom-raised-buttons nil)  ; flat buttons

(setq-default show-trailing-whitespace t)  ; even outside of whitespace mode

;; ---------------------------------------------------------------------------
;; External package mode configuration
;; ---------------------------------------------------------------------------

;; hlinum-mode: https://github.com/tom-tan/hlinum-mode
(setq nlinum-highlight-current-line t)  ; we use nlinum not linum so set this
(require 'hlinum)
(hlinum-activate)

;; Use nlinum instead of built-in linum as former uses jit-lock so is more
;; perfomant which will reduce lag for files with several thousand lines.
(require 'nlinum)
(global-nlinum-mode t)

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

;; rainbow delimiters for colours indicating paired parentheses, brackets, etc.
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

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
;; Additional major modes
;; ---------------------------------------------------------------------------

;; For YAML config.
(require 'yaml-mode)
;; Enable mode for .yml as well as .yaml extensions (both commonly used)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; ---------------------------------------------------------------------------
;; Org mode specific config and customisation
;; ---------------------------------------------------------------------------

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Set the encoding system
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(if (boundp buffer-file-coding-system)
    (setq buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Disable Chinese, Japanese and Korean characters
(setq utf-translate-cjk-mode nil)

;; Customise asterisks as bullet points for nested lists
(require 'org-bullets)
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("◓" "◑" "◒" "◐" "◴" "◷" "◶" "◵"))
(setq org-ellipsis " ➕")

;; Use variable-pitch font for nicer freehand text look, but not on code etc.
(defun set-buffer-variable-pitch ()
  (interactive)
  (variable-pitch-mode t)
  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-block-background nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  )

(add-hook 'org-mode-hook 'set-buffer-variable-pitch)
(add-hook 'markdown-mode-hook 'set-buffer-variable-pitch)  ; also for md mode

;; Syntax highlighting for code snippets inside 'BEGIN_SRC ... END_SRC' blocks
(setq org-src-fontify-natively t)

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

;; ---------------------------------------------------------------------------
;; Custom functions
;; ---------------------------------------------------------------------------

(defun close-emacs ()
  (interactive)
  (mapc 'save-buffers-kill-emacs (frame-list))
)
