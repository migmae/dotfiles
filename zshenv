# main zshenv file

# path to the zsh configuration files
export ZSH=$HOME/.zsh

# loader function
#   - load all of the config files from the path passed as an arugment
function loader() {
  for config_file ($1/*.zsh) source $config_file
  unset config_file
}

# load env libs
loader "$ZSH/lib/env"

# vim:set ft=zsh:
