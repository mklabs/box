# box

> Installation script to setup a workstation and bootstrap a fresh installation.

- ArchLinux Manjaro
- Gnome Shell / i3wm
- [Termite][]
- [Fish][] / [Fisherman]
- Paper Theme
- Droid Sans Mono / Roboto
- ag / fzf / z

**Terminal**: [Termite](https://github.com/thestinger/termite) with
[Fish](https://fishshell.com/) / [fisher](https://github.com/fisherman/fisherman),
[pure](https://github.com/rafaelrinaldi/pure) theme and
[Roboto](https://www.google.com/fonts/specimen/Roboto) font.

[Termite]: https://github.com/thestinger/termite
[Fish]: https://fishshell.com/
[Fisherman]: https://github.com/fisherman
[pure]: https://github.com/rafaelrinaldi/pure

## Install

The [bin/](./bin) directory includes installation script for various
distribution. It goes a little bit beyond the idea of dotfiles, and setup a new
fresh distrib with all the softwares that I use, going from desktop
environment to display manager and theme/terminal.

```sh
git clone git://github.com/mklabs/box.git
cd box
./bin/manjaro.sh
```
