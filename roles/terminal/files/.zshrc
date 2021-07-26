eval $(/opt/homebrew/bin/brew shellenv)

# Source any files under .zshrc.d
for file in ~/.zshrc.d/*.sh; do
  source $file
done
