# Enable zsh-git-prompt for enhanced prompt
source "$(brew --prefix)/opt/zsh-git-prompt/zshrc.sh"
PROMPT='%B%m%~%b$(git_super_status) %# '
