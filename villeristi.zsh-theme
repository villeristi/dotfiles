RED="%{$FG[001]%}"
CYAN="%{$FG[004]%}"
MAGENTA="%{$FG[005]%}"
ORANGE="%{$FG[009]%}"
LIGHTGREY="%{$FG[250]%}"

local ret_status="%(?:%{$CYAN%} ➜ :%{$RED%} ➜ %s)"
#local ret_status="%(?:%{$fg[green]%} ⚙ :%{$fg[red]%} ⚙ %s)"

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

PROMPT='$ret_status %{$LIGHTGREY%}$(get_pwd) $(git_prompt_info)%{$reset_color%}%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$CYAN%}@%{$reset_color%} %{$MAGENTA%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓%{$reset_color%}"
