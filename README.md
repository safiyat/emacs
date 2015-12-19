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
 - Add a package to cleanup whitespace.
 - Add package to view Markdown files. [markdown-mode.el](http://jblevins.org/projects/markdown-mode/markdown-mode.el).
 - initial-scratch-message to nil.
 - Add something like an upstart feature that fires up an emacs server for every user, as soon as the os runs.
 - ~~Inhibit-startup-screen.~~
 - ~~Hide menu bar, tool bar, scroll bar.~~
 - ~~Write script to enable auto-killing of emacs when shutting down or rebooting.
     <br>Script to go in `/etc/init.d/`. Symlinks in `/etc/rc0.d/K??kill_emacs` and `/etc/rc6.d/K??kill_emacs`.~~

Bugs
----
- C-TAB switches between windows in different frames.
- Run emacs server per user when started. ~~Update run_emacs to only `pgrep` for the current user.~~
- ~~Do the same as above for kill emacs.~~
- ~~**Big trouble with `desktop-save-in-desktop-dir`. Make if something like a `-f`.**~~

Features
--------
### Keybindings:

#### File Operations

|                                       |                        |
|:--------------------------------------|:----------------------:|
|Open a file				|		C - x - f|
|Save a file				|		C - x - s|
|Save a file as				|		C - x - w|
|Close a file				|		C - x   k|
|Close Emacs				|		C - c - x|


#### Edit Operations

|                                       |                    |
|:--------------------------------------|:------------------:|
|Delete the character after the mark	|		C - d|
|Delete the character before the mark	|		C - h|
|Cut the word after the mark 		|		M - d|
|Delete the word before the mark	|		C - w|
|Cut to the end of line	       		|		C - k|
|Cut to the beginning of line		|		C - u|
|Insert a blank line			|		C - o|
|Undo					| C - _ ` ` C - x   u|
|Cut					|    		C - w|
|Copy					|		M - w|
|Paste					|		C - y|
|Search					|		C - s|
|Indent selection			|	    C - M - \|


#### Navigation

|                                       |                            |
|:--------------------------------------|:--------------------------:|
|Go to beginning of file		|			M - <|
|Go to end of file			|			M - >|
|Go to beginning of line		|			C - a|
|Go to end of line  			|			C - e|
|Go to next character			|			C - f|
|Go to previous character		|			C - b|
|Go to next word			|			M - f|
|Go to previous word			|			M - b|
|Go to next line			|			C - n|
|Go to previous line			|			C - p|
|Move forward one screenful		|			C - v|
|Move backward one screenful		|			M - v|
|Go to line number			|		    M - g - g|

####BUFFER MANAGEMENT

|                                       |                          |
|:--------------------------------------|:------------------------:|
|Switch buffer (same window)		|		  C - x   b|
|List buffers  	    			|		  C - x - b|
|Kill a buffer				|		  C - x   k|
|Switch to other window			|		  C - x   o|
|Close the window			|		  C - x   0|
|Close all other windows		|		  C - x   1|
|Open a new window below		|		  C - x   2|
|Open a new window across		|		  C - x   3|
|Grow a window taller			|		  C - x   ^|
|Grow a window narrower			|		  C - x   {|
|Grow a window wider			|		  C - x   }|
|Scroll buffer up                       |                M - S - up|
|Scroll buffer down                     |              M - S - down|

#### COMMAND MANAGEMENT

|                                          |                       |
|:-----------------------------------------|:---------------------:|
|Cancel a command			   |		C - g      |
