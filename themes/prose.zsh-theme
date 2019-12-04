# based on: http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# this should go in ~/.oh-my-zsh/themes
D=$'\e[37;40m'
PINK=$'\e[35;40m'
GREEN=$'\e[32;40m'
ORANGE=$'\e[33;40m'

export PS1='\n${PINK}\u${D}@${ORANGE}\h${D}::${GREEN}\w\${D}\n$ '

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function kubecontext_info {
  kubectx=$(kubectl config current-context)
  if [[ $kubectx == *"stage"* ]]; then
        echo "%B%{$fg[yellow]%}bynk-stage!!%{$reset_color%}%b"
  elif [[ $kubectx == *"prod"* ]]; then
        echo "%B%S%{$fg[red]%}bynk-prod!!!%{$reset_color%}%s%b"
  fi
}

PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}$(git_prompt_info)
$(virtualenv_info)$(kubecontext_info)$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"
RPROMPT='${return_status}%{$reset_color%}'
