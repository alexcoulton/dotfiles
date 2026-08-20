# dotfiles

Personal configuration for Neovim, tmux, Vim, ctags, and related command-line
tools.

## Contents

- `nvim-modern/` — the current reproducible Neovim 0.12.4 configuration.
- `archive/nvim-legacy/` — the previous Neovim 0.7 configuration, retained for
  reference.
- `.tmux.conf`, `.vimrc`, and `.ctags` — terminal and editor configuration.
- `make.softlinks.sh` — installs the managed configuration with symbolic links.

See [`nvim-modern/README.md`](nvim-modern/README.md) for Neovim prerequisites,
installation details, dependency management, and key workflows. Archived
configuration is documented in [`archive/README.md`](archive/README.md).

## Install

Clone the repository and run the linking script:

```sh
git clone https://github.com/alexcoulton/dotfiles.git ~/dotfiles
~/dotfiles/make.softlinks.sh
```

The script derives the repository location automatically. It creates links for
the managed files, the `nvim-modern` profile, and its launcher. Existing real
files or directories are left untouched and reported instead of overwritten.

Ensure `~/.local/bin` is on `PATH`, then launch the modern profile with:

```sh
nvim-modern
```

The legacy Neovim configuration is archived only and is not installed by the
linking script.
