;; blogging.el
;; ------------------
;; A set of small functions used to help me write & publish blog entries
;;
;; Author: Doug Swain (dswain@gmail.com)

(setq blog-py-gen-entry-script (expand-file-name "~/Programming/Websites/pseudoramble.com/blog/src/generate_entry.py"))
(setq blog-docs-dir (expand-file-name "~/Programming/Websites/pseudoramble.com/blog/entry/docs/"))
(setq blog-entries-dir (expand-file-name "~/Programming/Websites/pseudoramble.com/blog/entry/"))
(setq blog-file-type ".md")
(setq blog-template-file-name (expand-file-name "~/Programming/Websites/pseudoramble.com/blog/template.html"))

(defun blog-new-entry (name)
  "Creates a new file under (concat blog-docs-dir name blog-file-type). It does not save it by default"
  (interactive "sName: ")

  (let ((filename (concat blog-docs-dir name blog-file-type)))
    (let ((blog-entry-buffer (find-file-noselect filename)))
      (switch-to-buffer blog-entry-buffer)
      (set-buffer blog-entry-buffer))))

(defun blog-gen-entry ()
  "Takes file and generates HTML from Markdown. Ships it to another tool for additional mods & formatting"
  (interactive)
  (let ((output-filename (concat blog-entries-dir (blog-fetch-filename) ".html"))
        (input-filename (concat blog-docs-dir "temp.html")))
    (markdown-export input-filename)
    ;; Execute the Python rewriting code on the temp.html file generated in the last step.
    ;; Output it to the $working-dir/$filename.html
    ;; Use the specified template file
    (shell-command (concat "python " blog-py-gen-entry-script " " input-filename " " output-filename " " blog-template-file-name))
    (delete-file input-filename)))

(defun blog-publish-entry ()
  (interactive)
  (git-status blog-entries-dir)
  (git-mark-all)
  (git-commit-file))

(defun blog-socialize-entry ()
  
  )

(defun blog-fetch-filename ()
  (file-name-sans-extension (buffer-name (current-buffer))))
