# rails aliases from oh-my-zsh rails3 plugin

function _rails_command () {
  if [ -e "script/server" ]; then
    ruby script/$@
  else
    ruby script/rails $@
  fi
}

alias rc='_rails_command console'
alias rd='_rails_command destroy'
alias rdb='_rails_command dbconsole'
alias rdbm='rake db:migrate db:test:clone'
alias rg='_rails_command generate'
alias rp='_rails_command plugin'
alias rs='_rails_command server'
alias rsd='_rails_command server --debugger'
alias devlog='tail -f log/development.log'

# vim:set ft=zsh: