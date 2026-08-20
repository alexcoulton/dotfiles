# nvim-modern

An isolated, reproducible Neovim 0.12.4 profile. It reproduces the effective
behaviour of `~/.config/nvim` without sharing its configuration, plugins,
state, cache, or undo history.

## What is pinned

- Neovim is required to be exactly 0.12.4.
- `lazy-lock.json` fixes every plugin to an exact Git commit.
- lazy.nvim's first bootstrap is fixed to the commit in `lua/modern/lazy.lua`.
- Mason language servers, formatters, linters, debugger, and Tree-sitter CLI
  are fixed to explicit versions in `lua/modern/plugins/lsp.lua`.
- The locked nvim-treesitter commit contains the exact parser revisions used
  when compiling the configured parsers.

Downloaded plugins, Mason packages, parsers, caches, state, and credentials
are deliberately not stored in this repository. They are restored from the
committed configuration and lockfile.

## External prerequisites

On macOS with Homebrew:

```sh
brew install git fd ripgrep tmux lazygit
brew install --cask font-jetbrains-mono-nerd-font
```

iTerm2 is also required for the current terminal workflow. In its profile
text settings, select `JetBrainsMono Nerd Font Mono` for both normal and
non-ASCII text.

The R integration expects the `macsima-stitch-local` Conda environment to be
active and to provide R 4.5.2. Reproduce that project environment separately
and activate it before the first launch so Mason can install the pinned R
language server against the correct R installation.

## Install Neovim 0.12.4

For an Apple Silicon Mac:

```sh
curl -fLO https://github.com/neovim/neovim/releases/download/v0.12.4/nvim-macos-arm64.tar.gz
printf '%s  %s\n' \
  51ab83afa66d663627c2ab1be43209b0f4e81360d4598b53efaa4d8195f24c89 \
  nvim-macos-arm64.tar.gz | shasum -a 256 -c -
xattr -c nvim-macos-arm64.tar.gz
tar xzf nvim-macos-arm64.tar.gz
mkdir -p ~/.local/opt
mv nvim-macos-arm64 ~/.local/opt/nvim-0.12.4
```

For an Intel Mac, use `nvim-macos-x86_64.tar.gz`; its SHA-256 is
`03fe16f8dd9f1e9eaf52d5e294913a39917b9e2faea30d7fb0fb385fbd36fe59`.

## Install this configuration

Clone the dotfiles repository and run its linking script:

```sh
git clone https://github.com/alexcoulton/dotfiles.git ~/dotfiles
~/dotfiles/make.softlinks.sh
```

This links `~/dotfiles/nvim-modern` to `~/.config/nvim-modern` and installs the
`nvim-modern` launcher in `~/.local/bin`. Existing real files or directories
are left untouched and reported by the script.

Make sure `~/.local/bin` is on `PATH`, activate the R environment, and start:

```sh
conda activate macsima-stitch-local
nvim-modern
```

To make this profile the default interactive `nvim` command, add the following
to `~/.bash_profile` or `~/.zshrc`:

```sh
alias nvim='nvim-modern'
```

Allow the first installation to finish. To explicitly restore every locked
dependency and check the result, run:

```vim
:Lazy restore
:MasonToolsInstallSync
:checkhealth
```

Restart Neovim after the first Mason installation completes.

## Updating deliberately

`:Lazy restore` returns plugins to `lazy-lock.json`. `:Lazy update` advances
plugins and rewrites the lockfile, so commit and test that change as a single
update.

Mason does not update pinned tools automatically. Change the corresponding
`version` in `lua/modern/plugins/lsp.lua`, run `:MasonToolsInstallSync`, test,
and commit the change.

Tree-sitter parser revisions move only when the locked nvim-treesitter commit
moves. After such an update, run `:TSUpdate`, test highlighting and folding,
and commit the new `lazy-lock.json`.

## Isolation

The launcher sets `NVIM_APPNAME=nvim-modern`, giving the profile its own:

- config: `~/.config/nvim-modern`
- data and plugins: `~/.local/share/nvim-modern`
- state: `~/.local/state/nvim-modern`
- cache: `~/.cache/nvim-modern`

The existing `nvim` command and `~/.config/nvim` are not used or modified.

Set `NVIM_MODERN_NVIM` if the pinned executable is installed somewhere other
than `~/.local/opt/nvim-0.12.4/bin/nvim`.

## REPL workflow

vim-slime targets tmux. The first send in a buffer prompts for the tmux pane.

- Normal `Space`: send current line
- Visual `Space`: send selection
- `<C-c><C-c>`: vim-slime's original send mapping
- `<C-c>v` or `:SlimeConfig`: configure the target pane
- Python buffers: bracketed paste enabled

The temporary paste file remains isolated at
`~/.cache/nvim-modern/slime_paste`.

## Inspection

Use `:Lazy`, `:Mason`, and `:checkhealth` to inspect the installed state.
`<C-g>` or `,fp` opens the on-demand project picker for Git repositories
under `~/work`.
