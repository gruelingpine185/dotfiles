# -- Spaceship --

SPACESHIP_PROMPT_ORDER=(
  dir    # current directory
  git    # git status & git branch
  sudo   # sudo indicator
  char   # prompt character
)

# add newline after each prompt (default: true)
SPACESHIP_PROMPT_ADD_NEWLINE=false

# split prompt across 2 lines (default: true)
SPACESHIP_PROMPT_SEPARATE_LINE=false

# -- Git --

# icon before git branch (default: "$SPACESHIP_GIT_SYMBOL")
SPACESHIP_GIT_BRANCH_PREFIX=""

# text between current git branch  (default: "on ")
SPACESHIP_GIT_PREFIX=""

# text before git status (default: " [")
SPACESHIP_GIT_STATUS_PREFIX=" "

# text after git status (default: "]")
SPACESHIP_GIT_STATUS_SUFFIX=""
