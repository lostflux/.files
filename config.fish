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

# aliases
source "alias.fish"

# zoxide
zoxide init fish | source


# prompt
function fish_prompt
  echo "\e[0;31mλ>\e[0m "
end

# NOTE: used to track prev command for pre-exec
set -g _PREV_CMD ""

# pre-exec handler
# if command is empty, print the current directory

function fish_preexec --on-event fish_preexec
  # NOTE: use regex to extract command ONLY
  # from last entry in history

  set -g _PREV_CMD (string match -r '^[A-Za-z]*' $argv)

  #? debug
  # echo "set _PREV_CMD '$_PREV_CMD'"
end

function fish_preprompt --on-event fish_prompt
  if test $_PREV_CMD = "" -o $_PREV_CMD = "where" -o $_PREV_CMD = "cd" -o $_PREV_CMD = "clear"
    # echo (pwd)
    echo "\e[0;31m$(pwd)\e[0m"
  end

  #? reset prev CMD
  set -g _PREV_CMD ""
end

function where
  # NOTE: dummy func for printign PWD on enter
  # printf "\e[0;31m%s\e[0m " (pwd)
end
