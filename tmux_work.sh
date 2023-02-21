#!/bin/bash

#---------------------------------------------------------------

#create new session
tmux new-session -d -s mysession

#---------------------------------------------------------------

#launch htop in big panel on left
tmux send-keys -t mysession "htop" Enter

#---------------------------------------------------------------

#launch tree every 3s
tmux split-window -h -t mysession:0
tmux send-keys -t mysession:0 "watch -n 3 tree" Enter

#---------------------------------------------------------------

#git
tmux split-window -v -t mysession
# old config
#tmux split-window -v -p 50 -t mysession
#tmux send-keys -t mysession "clear" Enter
tmux send-keys -t mysession "git status" Enter

#---------------------------------------------------------------

#make
tmux select-pane -t mysession
tmux split-window -v -t mysession
#type but dont send the command
tmux send-keys -t mysession "make"

#---------------------------------------------------------------

#prepare for launch of ./app.exe
tmux select-pane -t mysession
tmux split-window -v -t mysession
#type but dont send the command
tmux send-keys -t mysession "./app"

#---------------------------------------------------------------

#change layout
tmux select-layout main-vertical

#---------------------------------------------------------------

# Attach to session 
tmux attach -t mysession

#---------------------------------------------------------------

