# Prompt functions from https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/agnoster.zsh-theme

prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

prompt_dir() {
  echo -n "$(shrink_path -t -l)"
}

prompt_end() {
  echo -n " %{$fg_bold[green]%}➜%{$reset_color%} "
}

# Git: branch/detached head, dirty status
prompt_git() {
  (( $+commands[git] )) || return
  if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
    return
  fi

  # local PL_BRANCH_CHAR
  # () {
  #   local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  #   PL_BRANCH_CHAR=$'\ue0a0'         # 
  # }
  
  local ref dirty mode repo_path

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    repo_path=$(git rev-parse --git-dir 2>/dev/null)
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
    
    # if [[ -n $dirty ]]; then
    #   prompt_segment yellow black
    # else
    #   prompt_segment green $CURRENT_FG
    # fi

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:*' unstagedstr '●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info
    # echo -n "${ref/refs\/heads\//$PL_BRANCH_CHAR }${vcs_info_msg_0_%% }${mode}"
    echo -n "${ref/refs\/heads\// }${vcs_info_msg_0_%% }%{$reset_color%}"
  fi
}

prompt_time() {
  echo -n " %{%F{242}%}%*%{$reset_color%}"
}

build_prompt() {
  RETVAL=$?
  prompt_dir
  prompt_end
}

build_rprompt() {
  RETVAL=$?
  prompt_git
  prompt_time
}

PROMPT='%{%f%b%k%}$(build_prompt) '
RPROMPT='%{%f%b%k%}$(build_rprompt) '
