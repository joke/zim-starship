(( ${+commands[starship]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[starship]:-"$(${commands[asdf]} which starship 2> /dev/null)"}
  [[ -z $command ]] && return 1

  # generating init file
  local initfile=$1/starship-init.zsh
  if [[ ! -e $initfile || $initfile -ot $command ]]; then
    $command init zsh --print-full-init >| $initfile
    zcompile -UR $initfile
  fi

  # generating completions
  local compfile=$1/functions/_starship
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completions zsh >| $compfile
    print -u2 -PR "* Detected a new version 'starship'. Regenerated completions."
  fi

  source $initfile
} ${0:h}
