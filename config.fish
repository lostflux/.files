#!/usr/bin/env fish
# -*- coding: utf-8; -*-

if status is-interactive
  # Commands to run in interactive sessions can go here
  set fish_greeting
end

# gnupg terminal to use
export GPG_TTY=$(tty)

# load homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"


# zoxide
zoxide init fish --cmd cd | source

# command aliases
source "alias.fish"

# prompt change
source "prompt.fish"

# app exports
source "exports.fish"
