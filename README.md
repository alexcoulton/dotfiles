# dotfiles

Personal configuration for Neovim, tmux, Vim, ctags, and related command-line
tools.

## Contents

- `nvim/` — the current reproducible Neovim 0.12.4 configuration.
- `archive/nvim-legacy/` — the previous Neovim 0.7 configuration, retained for
  reference.
- `.tmux.conf`, `.vimrc`, and `.ctags` — terminal and editor configuration.
- `make.softlinks.sh` — installs the managed configuration with symbolic links.

See [`nvim/README.md`](nvim/README.md) for Neovim prerequisites,
installation details, dependency management, and key workflows. Archived
configuration is documented in [`archive/README.md`](archive/README.md).

## Install

Clone the repository and run the linking script:

```sh
git clone https://github.com/alexcoulton/dotfiles.git ~/dotfiles
~/dotfiles/make.softlinks.sh
```

The script derives the repository location automatically. It creates links for
the managed files, the `nvim` configuration, and its launcher. Existing real
files or directories are left untouched and reported instead of overwritten.
Move an existing `~/.config/nvim` directory aside before running the script if
you want this repository to provide the active configuration.

Ensure `~/.local/bin` is on `PATH`, then launch the modern profile with:

```sh
nvim
```

The legacy Neovim configuration is archived only and is not installed by the
linking script.
