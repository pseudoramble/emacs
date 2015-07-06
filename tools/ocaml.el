;; Initial path configuration for junk
(setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

;; Require some libs
(require 'merlin)
(require 'ocp-indent)
(require 'auto-complete)

;; Setup environment variables using opam
(dolist (var (car (read-from-string (shell-command-to-string "opam config env --sexp"))))
  (setenv (car var) (cadr var)))

;; Update the emacs path
(setq exec-path (append (parse-colon-path (getenv "PATH"))
                        (list exec-directory)))

;; Turareg
;; (add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
;; (add-hook 'tuareg-mode-hook 'auto-complete-mode)
;; (setq auto-mode-alist
;;       (append '(("\\.ml[ily]?$" . tuareg-mode)
;;                 ("\\.topml$" . tuareg-mode))
;;               auto-mode-alist)) 
(autoload 'utop "utop" "Toplevel for OCaml" t)
;;(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop)

(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)

;; Merlin
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode 'easy)
(setq merlin-error-after-save nil)
