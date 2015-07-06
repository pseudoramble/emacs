;; Adding some syntax highlighting for Clojure
(require 'clojure-mode)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

;; Adding some syntax highlighting for swank
(add-hook 'slime-repl-mode-hook
  (defun clojure-mode-slime-font-lock ()
    (require 'clojure-mode)
    (let (font-lock-mode)
      (clojure-mode-font-lock-setup))))
