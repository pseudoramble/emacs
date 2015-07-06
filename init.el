;; Some useful paths to include stuff from.
;; These load the first level of the directories within these folders
(defun add-toplevel-dirs-to-path (dir)
  (let ((default-directory dir))
    (normal-top-level-add-to-load-path '("."))
    (normal-top-level-add-subdirs-to-load-path)))

(add-toplevel-dirs-to-path (expand-file-name "~/.emacs.d/tools/"))
(add-toplevel-dirs-to-path (expand-file-name "~/.emacs.d/elpa/"))

(require 'cl)
(require 'ack)
(require 'helm-config)
(require 'git)

(load-library "custom-commands")
(load-library "modes")
(load-library "blogging")

;; Load a new theme!
;; Some default themes that I liked included:
;; tsdh-dark, wombat, misterioso
(load-theme 'misterioso)

;; Start up in fullscreen mode
(toggle-frame-maximized)

;; Enable desktop-save-mode
(desktop-save-mode 1)

;; Stop making backup files
(setq make-backup-files nil)

;; Set line/column numbers to display
(line-number-mode 1)
(column-number-mode 1)

;; Basic indentation stuff I like.
(setq c-basic-indent 4)
(setq tab-width 4)
(setq indent-tabs-mode nil)

;; Set the default buffer font. Set the size of the font as well.
;; You can use the built-in stuff to adjust your fonts however you want.
;; Then do M-x describe-font to get this font string.
(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")

;; Package management setup. Adds some repositories to find.
;; To install packages, M-x package-list-packages
(require 'package)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
    ("gnu" . "http://elpa.gnu.org/packages/")
    ("marmalade" . "http://marmalade-repo.org/packages/")
    ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; Screenshot.el config
(require 'screenshot)
(setq screenshot-schemes              ; edit as you like
      '(
        ;; To local image directory
        ("local"
         :dir "~/Images/screenshots")            ; Image repository directory
        ;; To current directory
        ("current-directory"          ; No need to modify
         :dir default-directory)
        ;; To remote ssh host
        ("remote-ssh"
         :dir "/tmp/"                 ; Temporary saved directory
         :ssh-dir "www.example.org:public_html/archive/" ; SSH path
         :url "http://www.example.org/archive/")  ; Host URL prefix
        ;; To EmacsWiki (need yaoddmuse.el)
        ("EmacsWiki"                 ; Emacs users' most familiar Oddmuse wiki
         :dir "~/.yaoddmuse/EmacsWiki/"  ; same as yaoddmuse-directory
         :yaoddmuse "EmacsWiki")         ; You can specify another Oddmuse Wiki
        ;; To local web server
        ("local-server"
         :dir "~/public_html/"           ; local server directory
         :url "http://127.0.0.1/")))     ; local server URL prefix
(setq screenshot-default-scheme "local") ; default scheme is "local"

;; Some handy custom keybindings
(global-set-key (kbd "C-x +") 'enlarge-window)
(global-set-key (kbd "C-x -") 'shrink-window)
(global-set-key (kbd "C->") 'scroll-up-line)
(global-set-key (kbd "C-<") 'scroll-down-line)
(global-set-key (kbd "C-h") `ack)
(global-set-key (kbd "C-x r") `replace-string)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(js2-enter-indents-newline t)
 '(js2-global-externs nil)
 '(js2-indent-on-enter-key t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
