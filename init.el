(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; -------------------------------------------------------------------------------
;; windows like select and cut/paste
(cua-mode t) 
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy nil) ;; Standard Windows behaviour
;; problem is that ctrl-z no longer works.  ctrl-c ctrl-z:
;; -------------------------------------------------------------------------------
;; my key-bindings
(global-set-key [(home)] (quote beginning-of-buffer))
(global-set-key [(end)] (quote end-of-buffer))
(global-set-key [(select)] (quote end-of-buffer))

;; why does this not come out on terminal?
(global-set-key (kbd "C-<return>") 'quickrun)

;; increase/decrease font size

(global-set-key (kbd "C-+") 'zoom-in)
(global-set-key (kbd "C-=") 'zoom-in)
(global-set-key (kbd "C--") 'zoom-out)


(global-set-key (kbd "C-r") 'buffer-menu-other-window)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
;;(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; toggle line numbers
(global-set-key (kbd "C-l") 'linum-mode)
;;(provide 'key-bindings)

;; -------------------------------------------------------------------------------
;; turn off toolbars and such
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))


;; show column in status bar
(column-number-mode 1)

(setq scroll-step 1) ; "Normal" scrolling, not the massive 1/2 screen jump.
;; indentation level
(setq-default c-basic-offset 2)
(setq default-tab-width 2)



;; -------------------------------------------------------------------------------
;; basic defaults
;; https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/

(setq delete-old-versions -1 ); delete excess backup versions silently
(setq version-control t ); use version control
(setq vc-make-backup-files t ); make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs-backups/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs-backups/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t ); inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore ); silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 ); use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil); sentence SHOULD end with only a point.
(setq default-fill-column 80); toggle wrapping text at the 80th character
(setq initial-scratch-message ";; Welcome to Emacs!\n") ; print a default message in the empty scratch buffer opened at startup

;; -------------------------------------------------------------------------------
;; where to get packages from
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(require 'package)

(require 'zoom-frm)
;; -------------------------------------------------------------------------------
;; nice theme
;; more here: https://www.reddit.com/r/emacs/comments/33be65/light_color_theme_recommendations/
;; -------------------------------------------------------------------------------
;;(load-theme 'moe-light t)
(unless  (display-graphic-p) 
  (add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme.el/")
  (add-to-list 'load-path "~/.emacs.d/moe-theme.el/")

	;;(setq moe-light-pure-white-background-in-terminal t)
	
  (require 'moe-theme)
  (moe-light))

  
;;(moe-theme-set-color 'orange)
;; (Available colors: blue, orange, green ,magenta, yellow, purple, red, cyan, w/b.)
(if (display-graphic-p) 
    (load-theme 'leuven t))


;; -------------------------------------------------------------------------------
;; comment of uncomment current line or region
;; http://stackoverflow.com/questions/9688748/emacs-comment-uncomment-current-line
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))
;; can't map ctrl-; :-(
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
	 [default default default italic underline success warning error])
 '(ansi-color-names-vector
	 ["#bcbcbc" "#d70008" "#5faf00" "#875f00" "#268bd2" "#800080" "#008080" "#5f5f87"])
 '(custom-safe-themes
	 (quote
		("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "da15b6c37879302bc0d751e1f53db16d0f610df612f0b1edc1ec514dddb1ba23" "32e3693cd7610599c59997fee36a68e7dd34f21db312a13ff8c7e738675b6dfc" "74278d14b7d5cf691c4d846a4bbf6e62d32104986f104c1e61f718f9669ec04b" "dbb643699e18b5691a8baff34c29d709a3ff9787f09cdae58d3c1bc085b63c25" default)))
 '(hl-sexp-background-color "#efebe9"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
