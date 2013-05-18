# .zshenv: sets the search path and env variables

# clear PATH
export BACKUP_PATH=$PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"

export EDITOR=vim
export PAGER=less
# export CLICOLOR="true"
# export LSCOLORS="Gxfxcxdxbxegedabagacad"
# export TERM=xterm-256color # set terminal colors

# Heroku Toolbelt
if [[ -d "/usr/local/heroku/bin" ]] ; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

# add texlive to PATH
if [[ -d "/usr/local/texlive/2012basic/bin/universal-darwin" ]]; then
  export PATH="/usr/local/texlive/2012basic/bin/universal-darwin:$PATH"
fi

# load bin from safe dirs
export PATH=".safe/../bin:$HOME/.bin:$PATH"

# Boxen
# -----------------------------------------------
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# vim:set ft=zsh:
