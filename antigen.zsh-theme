# inspired by sorin.zsh-theme
NORMAL_MODE_INDICATOR="%{$fg[yellow]%}❮%{$fg[green]%}❮%{$fg[red]%}❮%{$reset_color%}"
INSERT_MODE_INDICATOR="%{$fg[yellow]%}❯%{$fg[green]%}❯%{$fg[red]%}❯%{$reset_color%}"

function vi_mode_info() {
	if [[ -z $KEYMAP ]]; then
		echo $INSERT_MODE_INDICATOR
	else
		echo "${${KEYMAP/vicmd/$NORMAL_MODE_INDICATOR}/(main|viins)/$INSERT_MODE_INDICATOR}"
	fi
}

local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

PROMPT='%{$fg[cyan]%}%~$(git_prompt_info) %(!.%{$fg_bold[red]%}#.$(vi_mode_info))%{$reset_color%} '
RPROMPT='${return_status}$(git_prompt_status)%{$reset_color%}'
