My .emacs "file"
--------------------

This is where I'll keep and track my emacs setup.The structure is ever-evolving (in other words - I have no idea how I like or want things setup) but roughly speaking it looks like this:

* init.el
 * Contains a variety of imports and things needed to get started with the setup.
 * Also contains some keyboard shortcuts I like.
* tools/
 * custom-commands.el
     * Stores new commands that I find that are useful
     * Generally are not associated to a specific tool or package besides emacs itself.
     * `spawn-shell`, `reloading-dotemacs-file`, `rename-file-and-buffer`, etc.
 * modes.el
     * Sets up different major modes I'm interested in using at the time.
 * All other files are associated to a specific tool or mode (ack, screenshot).

