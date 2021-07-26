tms () {
  local projName=$1

  # kill session if it already exists
  if $(tmux ls | grep -q $projName); then
    tmux kill-session -t $projName
  fi

  # new session with main wndow
  tmux new-session -s $projName -d
  tmux send-keys "cd ~/src/$projName" Enter

  # new window for project 
  tmux new-window -t $projName:1
  tmux split-window -t $projName:1 -h -p 10
  tmux send-keys "cd ~/src/$projName" Enter
  tmux split-window -t $projName:1 -v -p 20
  tmux send-keys "cd ~/src/$projName" Enter
  tmux select-pane -t $projName:1 -L
  tmux send-keys "cd ~/src/$projName" Enter
  tmux send-keys 'vim' Enter

  tmux attach -t $projName
}
