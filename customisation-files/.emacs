(global-font-lock-mode t)
(custom-set-faces
  '(default ((t (:inherit nil :stipple nil :background "#0a0f14" :foreground "#98d1ce" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "DejaVu Sans Mono-12"))))
  '(comint-highlight-prompt ((((min-colors 88) (background dark)) (:foreground "#C33027"))))
  '(font-lock-builtin-face ((((class color) (min-colors 88) (background dark)) (:foreground "#ffe985"))))
  '(font-lock-comment-face ((((class color) (min-colors 88) (background dark)) (:foreground "#00384d"))))
  '(font-lock-constant-face ((((class color) (min-colors 88) (background dark)) (:foreground "#888BA5"))))
  '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "#33859D"))))
  '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "#C33027"))))
  '(font-lock-string-face ((((class color) (min-colors 88) (background dark)) (:foreground "#336ad4"))))
  '(font-lock-type-face ((((class color) (min-colors 88) (background dark)) (:foreground "#33859D"))))
  '(font-lock-variable-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "#ffffff"))))
 )

;; line numbers on the LHS in different colouring:
(global-linum-mode t)
(set-face-foreground 'linum "#98d1ce")
(set-face-background 'linum "#00384d")
