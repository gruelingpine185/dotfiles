git_is_in_repo() {
  git rev-parse --is-inside-work-tree > /dev/null 2>&1
}

git_checkout_branch() {
  git_is_in_repo || return 1
  if [[ $# -ne 0 ]]; then
    git checkout $@
    return $?
  fi

  local preview_cmd="echo '{}' | \
    sed 's/.* //' | \
    xargs git log --color=always --graph --pretty=format:'%C(yellow)%h%Creset %C(magenta)%as%Creset %s %Cred%d%Creset'"

  local branch=$(
    git branch --all --sort=-committerdate |
    rg -v HEAD |
    fzf --no-multi --no-sort --reverse --preview $preview_cmd |
    sed "s/.* //"
  )

  if [[ -n $branch && $branch != $(git branch --show-current) ]]; then
    git checkout $branch
    return $?
  fi
}

git_commit() {
  git_is_in_repo || return 1
  local message="$1"
  local preview_cmd="echo '{}' | \
    sed 's/^...//' | \
    xargs git diff -- | \
    bat --color always -p"
  local output=("${(@f)$(git status -s | \
    fzf --multi --reverse --exit-0 --print-query --preview $preview_cmd)}"
  )

  if [[ -z $message ]]; then
    message="$output[1]"
  fi

  local selected_files=()
  for line in ${output[@]:1}; do
    selected_files+=$(echo $line | sed "s/^...//")
  done

  if [[ -n $selected_files ]]; then
    git commit -m "$message" $selected_files
    return $?
  fi
}

git_add() {
  git_is_in_repo || return 1
  local preview_cmd="bat --color always {}"
  local output=("${(@f)$(fzf --multi --reverse --exit-0 --preview $preview_cmd)}")
  local selected_files=()

  for line in ${output[@]}; do
    selected_files+=$(echo $line)
  done

  if [[ -n $selected_files ]]; then
    git add $selected_files
    return $?
  fi
}

alias gc="git_commit"
alias ga="git_add"
alias gco="git_checkout_branch"
