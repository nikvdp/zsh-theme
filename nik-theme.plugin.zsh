# zsh theme/prompt
unsetopt autoremoveslash
setopt promptsubst

nice_blue=$FG[117]

PROMPT_SUCCESS_COLOR=$FG[077]
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$FG[077]
GIT_DIRTY_COLOR=$FG[133]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[012]

ret_status="%(?:%{$PROMPT_SUCCESS_COLOR%}$prompt_thingy:%{$PROMPT_FAILURE_COLOR%}$prompt_thingy%s)"

reset_color=$FX[reset]
# RPS1='%{$fg[blue]%}%~%{$reset_color%} '
# RPS1='%{$fg[white]%}%2~$(git_prompt_info) %{$fg_bold[blue]%}%m%{$reset_color%}'
PROMPT='%{$nice_blue%}$prompt_hostname:%{$fg[green]%}%~%{$reset_color%} %{$reset_color%}%{$PROMPT_PROMPT%}$ret_status%{$reset_color%}%(#~ # ~) '
if git_prompt_status > /dev/null 2>&1 ; then
    PROMPT='%{$nice_blue%}$prompt_hostname:%{$fg[green]%}%~%{$reset_color%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}%{$PROMPT_PROMPT%}$ret_status%{$reset_color%}%(#~ #~) '
fi

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡ %{$fg[yellow]%}"

