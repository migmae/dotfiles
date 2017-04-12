# Prompt
# -----------------------------------------------

autoload -U colors
colors
setopt prompt_subst

## Git info
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}!%f'
# zstyle ':vcs_info:*' branchformat '%F{green}%b%f'
zstyle ':vcs_info:*' formats ' %F{yellow}%8.8i%f %F{green}%b%f%c%u%m'
zstyle ':vcs_info:*' actionformats ' %F{yellow}%8.8i%f %F{green}%b%f %F{red}%a%f%c%u'

# Hooks!
# zstyle ':vcs_info:*+*:*' debug true # enable to debug hooks
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-unmerged
function +vi-git-untracked() {
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]] ; then
    hook_com[misc]+="%F{yellow}?%f"
  fi
}

function +vi-git-unmerged() {
  if [[ -n $(git ls-files --unmerged 2> /dev/null) ]] ; then
    hook_com[misc]+="%F{red}*%f"
  fi
}

## Vi mode
export INSERT_MODE='%F{blue}%#%f'
export NORMAL_MODE='%F{yellow}>%f'
export SYMBOL=$INSERT_MODE

function zle-line-init zle-keymap-select {
  if [ $KEYMAP = vicmd ]; then
    SYMBOL=$NORMAL_MODE
  else
    SYMBOL=$INSERT_MODE
  fi

  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

## Fish like CWD
function _fish_cwd() {
  if [[ $PWD == $HOME ]] ; then
    echo "~"
  else
    # This piece of magic comes from here:
    # https://github.com/robbyrussell/oh-my-zsh/issues/5068#issuecomment-218780098
    echo ${${:-/${(j:/:)${(M)${(s:/:)${(D)PWD:h}}#(|.)[^.]}}/${PWD:t}}//\/~/\~}
  fi
}

function precmd() {
  vcs_info
}

local return_code="%(?..%F{red}[%?] %f)"
PROMPT='%F{blue}$(_fish_cwd)%f${vcs_info_msg_0_} ${return_code}${SYMBOL} '
