.emacs
======

Installation
------------
Installation is all simplified! <br><br>
**Requirement:** 38 MB of internet (not required if you already have [emacs-24.5.tar.xz](https://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.xz))

#### Steps:
 1. Run [`setup.sh`](./setup.sh).
 2. Thank me!

To-do
--------
 - Add something like an upstart feature that fires up an emacs server for every user, as soon as the os runs.
 - Copy the `run.sh` script to `/usr/local/bin/emacs` to enable the emacs shortcut for every user. Also, copy the `.emacs.d` directory to some location that is accessible to everyone.
 - Add a -f switch to killemacs so as to do a `kill -9` and cleanup the server socket file post that.
 - ~~Add package to view Markdown files. [markdown-mode.el](http://jblevins.org/projects/markdown-mode/markdown-mode.el).~~
 - ~~Add a package to cleanup whitespace.~~ [This.](http://www.gnu.org/software/emacs/manual/html_node/emacs/Useless-Whitespace.html)
 - ~~Inhibit-startup-screen.~~
 - ~~Hide menu bar, tool bar, scroll bar.~~
 - ~~Write script to enable auto-killing of emacs when shutting down or rebooting.
     <br>Script to go in `/etc/init.d/`. Symlinks in `/etc/rc0.d/K??kill_emacs` and `/etc/rc6.d/K??kill_emacs`.~~
 - ~~Use space instead of TABs.~~
 - ~~Enable/disable whitespace cleanup.~~
 - ~~Initial-scratch-message to nil.~~

Bugs
----
- C-TAB switches between windows in different frames.
- Run emacs server per user when started. ~~Update run_emacs to only `pgrep` for the current user.~~
- ~~Do the same as above for kill emacs.~~
- ~~Big trouble with `desktop-save-in-desktop-dir`. Make if something like a `-f`.~~
