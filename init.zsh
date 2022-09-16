(( ${+commands[starship]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[starship]:-"$(${commands[asdf]} which starship 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_starship
  [[ ! -e $compfile || $compfile -ot $command ]] && $command completion zsh >| $compfile

} ${0:h}
