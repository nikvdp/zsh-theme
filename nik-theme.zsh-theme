# zsh theme/prompt
make_zsh_colors() {
    #! /bin/zsh
    # A script to make using 256 colors in zsh less painful.
    # P.C. Shyamshankar <sykora@lucentbeing.com>
    # Copied from http://github.com/sykora/etc/blob/master/zsh/functions/spectrum/

    typeset -Ag FX FG BG

    FX=(
        reset     "%{[00m%}"
        bold      "%{[01m%}" no-bold      "%{[22m%}"
        italic    "%{[03m%}" no-italic    "%{[23m%}"
        underline "%{[04m%}" no-underline "%{[24m%}"
        blink     "%{[05m%}" no-blink     "%{[25m%}"
        reverse   "%{[07m%}" no-reverse   "%{[27m%}"
    )

    for color in {000..255}; do
        FG[$color]="%{[38;5;${color}m%}"
        BG[$color]="%{[48;5;${color}m%}"
    done


    ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}

}
make_zsh_colors

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

ret_status="%(?:%{$PROMPT_SUCCESS_COLOR%}[$prompt_thingy]:%{$PROMPT_FAILURE_COLOR%}[$prompt_thingy]%s)"

reset_color=$FX[reset]
# RPS1='%{$fg[blue]%}%~%{$reset_color%} '
# RPS1='%{$fg[white]%}%2~$(git_prompt_info) %{$fg_bold[blue]%}%m%{$reset_color%}'
PROMPT='%{$nice_blue%}$prompt_hostname:%{$fg[green]%}%~%{$reset_color%} %{$reset_color%}%{$PROMPT_PROMPT%}$ret_status%{$reset_color%}%(#~ # ~) '

# if git_prompt_status > /dev/null 2>&1 ; then
#     PROMPT='%{$nice_blue%}$prompt_hostname:%{$fg[green]%}%~%{$reset_color%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}%{$PROMPT_PROMPT%}$ret_status%{$reset_color%}%(#~ #~) '
# fi

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡ %{$fg[yellow]%}"

