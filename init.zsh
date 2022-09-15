local command="${commands[starship]:-${commands[asdf]:+$(asdf which starship)}}"

if (( ! ${+command} )); then
  return 1
fi

local compfile=${0:h}/functions/_starship
if [[ ! -e $compfile || $compfile -ot $command ]]; then
  $command completions zsh >| $compfile
fi
source <($command init zsh --print-full-inits)
