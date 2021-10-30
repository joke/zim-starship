if (( ${+commands[starship]} )); then
  if [[ ! -e ${0:h}/starship.zsh || ${0:h}/starship.zsh -ot ${commands[starship]} ]]; then
    ${commands[starship]} init zsh --print-full-init >| ${0:h}/starship.zsh
  fi
  source ${0:h}/starship.zsh
fi
