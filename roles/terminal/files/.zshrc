# Source any files under .zshrc.d
for file in ~/.zshrc.d/*.sh; do
  source $file
done
