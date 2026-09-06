#!/bin/sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

mkdir -p "$HOME/.codex"

link_path() {
  source_path=$1
  target_path=$2

  if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
    return
  fi

  if [ -f "$target_path" ] && [ ! -L "$target_path" ]; then
    backup_path="$target_path.backup.$(date +%Y%m%d%H%M%S).$$"
    cp -p "$target_path" "$backup_path"
    cmp -s "$target_path" "$backup_path"
    rm "$target_path"
    printf 'backed up existing file %s to %s\n' "$target_path" "$backup_path"
  elif [ -e "$target_path" ] || [ -L "$target_path" ]; then
    backup_path="$target_path.backup.$(date +%Y%m%d%H%M%S).$$"
    mv "$target_path" "$backup_path"
    printf 'moved existing path %s to %s\n' "$target_path" "$backup_path"
  fi

  ln -s "$source_path" "$target_path"
  printf 'linked %s -> %s\n' "$target_path" "$source_path"
}

link_path "$repo_dir/AGENTS.md" "$HOME/.codex/AGENTS.md"
link_path "$repo_dir/environment" "$HOME/.codex/environment"

printf '%s\n' 'Codex config links installed. Restart Codex if the updated global instructions are not visible.'
