;; Clojure
;(load-library "clj")

;; OCaml
(load-library "ocaml")

;; Rebol
(autoload 'rebol-mode "rebol" "Rebol Mode." t)
(add-to-list 'auto-mode-alist '("\\.r\\'" . rebol-mode))

;; Javascript - the 2nd edition?
(autoload `js2-mode "js2-mode" "JS2 Mode." t)
(add-to-list `auto-mode-alist `("\\.js$" . js2-mode))

;; F#
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/fsharp-mode/"))
(require 'fsharp-mode)
