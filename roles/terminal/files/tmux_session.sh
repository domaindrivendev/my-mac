PROJ_NAME=$1

# kill session if it already exists
if $(tmux ls | grep -q $PROJ_NAME); then
  tmux kill-session -t $PROJ_NAME
fi

# new session with main wndow
tmux new-session -s $PROJ_NAME -d
tmux send-keys "cd ~/src/$PROJ_NAME" Enter

# new window for project 
tmux new-window -t $PROJ_NAME:1
tmux split-window -t $PROJ_NAME:1 -h -p 10
tmux send-keys "cd ~/src/$PROJ_NAME" Enter
tmux split-window -t $PROJ_NAME:1 -v -p 20
tmux send-keys "cd ~/src/$PROJ_NAME" Enter
tmux select-pane -t $PROJ_NAME:1 -L
tmux send-keys "cd ~/src/$PROJ_NAME" Enter
tmux send-keys 'vim' Enter

tmux attach -t $PROJ_NAME
