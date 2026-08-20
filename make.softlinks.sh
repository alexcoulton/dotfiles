#!/bin/bash
set -eu

dotfiles_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

link_dotfile() {
    source_path="$1"
    target_path="$2"

    mkdir -p "$(dirname -- "$target_path")"

    if [ -L "$target_path" ]; then
        ln -sfn "$source_path" "$target_path"
    elif [ -e "$target_path" ]; then
        printf 'Skipping %s: path already exists\n' "$target_path" >&2
    else
        ln -s "$source_path" "$target_path"
    fi
}

link_dotfile "$dotfiles_dir/.vimrc" "$HOME/.vimrc"
link_dotfile "$dotfiles_dir/.tmux.conf" "$HOME/.tmux.conf"
link_dotfile "$dotfiles_dir/.ctags" "$HOME/.ctags"
link_dotfile "$dotfiles_dir/nvim" "$HOME/.config/nvim"
link_dotfile "$dotfiles_dir/nvim/bin/nvim" "$HOME/.local/bin/nvim"
