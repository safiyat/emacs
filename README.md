.emacs
======

Installation
------------

Put the custom-emacs directory in anywhere, then add this line in your .emacs, it will enable all the features of emacs-for-python package (editing configuration,keybindings, python stuff etc...)

    (load-file "/path/to/custom.el")


To-do
--------
 - ~~Write script to enable auto-killing of emacs when shutting down or rebooting.
     <br>Script to go in `/etc/init.d/`. Symlinks in `/etc/rc0.d/K??kill_emacs` and `/etc/rc6.d/K??kill_emacs`.~~
 - Add a package to cleanup whitespace.
 - Add package to view Markdown files. [markdown-mode.el](http://jblevins.org/projects/markdown-mode/markdown-mode.el).
 - ~~inhibit-startup-screen.~~
 - initial-scratch-message to nil.
 - ~~Hide menu bar, tool bar, scroll bar.~~
 - Add something like an upstart feature that fires up an emacs server for every user, as soon as the os runs.

Bugs
----
- **Big trouble with `desktop-save-in-desktop-dir`. Make if something like a `-f`.**
- C-TAB switches between windows in different frames.
- Run emacs server per user when started. Update run_emacs to only `pgrep` for the current user.
- ~~Do the same as above for kill emacs.~~

Features
--------

Keybindings:
