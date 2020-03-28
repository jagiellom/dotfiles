#joshdick's modified git prompt

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# Echoes a username/host string when connected over SSH (empty otherwise)
ssh_info() {
  [[ "$SSH_CONNECTION" != '' ]] && echo '%(!.%{$fg[red]%}.%{$fg[yellow]%})%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:' || echo ''
}

# Echoes information about Git repository status when inside a Git repository
git_info() {

  # Exit if not inside a Git repository
  ! git rev-parse --is-inside-work-tree > /dev/null 2>&1 && return

  # Git branch/tag, or name-rev if on detached head
  local GIT_LOCATION=${$(git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD)#(refs/heads/|tags/)}

  local AHEAD="%{$fg[red]%}⇡NUM%{$reset_color%}"
  local BEHIND="%{$fg[cyan]%}⇣NUM%{$reset_color%}"
  local MERGING="%{$fg[magenta]%}⚡︎%{$reset_color%}"
  local UNTRACKED="%{$fg[red]%}U:NUM%{$reset_color%}"
  local MODIFIED="%{$fg[yellow]%}M:NUM%{$reset_color%}"
  local STAGED="%{$fg[green]%}S:NUM%{$reset_color%}"

  local -a DIVERGENCES
  local -a FLAGS

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    DIVERGENCES+=( "${AHEAD//NUM/$NUM_AHEAD}" )
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    DIVERGENCES+=( "${BEHIND//NUM/$NUM_BEHIND}" )
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    FLAGS+=( "$MERGING" )
  fi

  local NUM_UNTRACKED="$(git ls-files --other --exclude-standard 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_UNTRACKED" -gt 0 ]; then
    FLAGS+=( "${UNTRACKED//NUM/$NUM_UNTRACKED} " )
  fi

  local NUM_MODIFIED="$(git diff --name-only 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_MODIFIED" -gt 0 ]; then
    FLAGS+=( "${MODIFIED//NUM/$NUM_MODIFIED} " )    
  fi

  local NUM_STAGED="$(git diff --name-only --cached 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_STAGED" -gt 0 ]; then
    FLAGS+=( "${STAGED//NUM/$NUM_STAGED} " )
  fi

  local -a GIT_INFO
  GIT_INFO+=( "\033[38;5;15m±" )
  [ -n "$GIT_STATUS" ] && GIT_INFO+=( "$GIT_STATUS" )
  [[ ${#DIVERGENCES[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)DIVERGENCES}" )
  [[ ${#FLAGS[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)FLAGS}" )
  GIT_INFO+=( "\033[38;5;15m$GIT_LOCATION%{$reset_color%}" )
  echo "${(j: :)GIT_INFO}"

}

# Use ❯ as the non-root prompt character; # for root
# Change the prompt character color if the last command had a nonzero exit code
PS1='
$(ssh_info)%{$fg[yellow]%}%~%u $(git_info)
%(?.%{$fg[green]%}.%{$fg[red]%})%(!.#.❯)%{$reset_color%} '

ZSH_DISABLE_COMPFIX="true"

export ZSH="/Users/mjagiello/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh
