(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;;; Make it feel like vim
(require 'evil)
(require 'go-direx) 
(evil-mode 1)
(setq evil-emacs-state-modes '(nav-mode))
(define-key evil-motion-state-map [left] 'nav-toggle)
(define-key evil-motion-state-map [right] 'go-direx-pop-to-buffer)
(define-key evil-motion-state-map [down] 'previous-buffer)
(define-key evil-motion-state-map [up] 'next-buffer)
(define-key evil-visual-state-map (kbd "R") 'eval-region)

;;; Make it pretty
(require 'color-theme)
(require 'color-theme-molokai)
;(require 'zenburn-theme) ; for daytime
(color-theme-molokai) ; for nighttime
(menu-bar-mode -1)

;;; Don't spam backups everywhere
(setq make-backup-files t)
(setq version-control t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(require 'lusty-explorer)

;;; Turn on line numbers
(require 'linum)
(setq linum-format "%4d\u2502 ")
(global-linum-mode)

;;; Go settings
(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(require 'auto-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-eldoc)
(add-hook 'go-mode-hook (lambda ()
		          (define-key evil-motion-state-map "gd" 'godef-jump)
			  (go-eldoc-setup)
			  ))


;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
			   (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
			       (interactive)
			       (scroll-down 3)))
  (global-set-key [mouse-5] '(lambda ()
			       (interactive)
			       (scroll-up 3)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
  )

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1) 

(add-to-list 'load-path "~/.emacs.d/emacs-nav")
(require 'nav)
(nav-disable-overeager-window-splitting)

;; change mode-line color by evil state
   ;; (lexical-let ((default-color (cons (face-background 'mode-line)
   ;;                                    (face-foreground 'mode-line))))
   ;;   (add-hook 'post-command-hook
   ;;     (lambda ()
   ;;       (let ((color (cond ((minibufferp) default-color)
   ;;                          ((evil-insert-state-p) '("#e80000" . "#ffffff"))
   ;;                          ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
   ;;                          ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
   ;;                          (t default-color))))
   ;;         (set-face-background 'mode-line (car color))
   ;;         (set-face-foreground 'mode-line (cdr color))))))
