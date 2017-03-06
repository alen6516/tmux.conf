#####
# File Name: work.sh
# Author: alen6516
# Created Time: 2017-03-06
#####
#!/bin/bash
tmux new-session -d -s workspace

tmux split-window -h -p 10 'vi .'
tmux select-pane -t 0 
tmux split-window -v -p 30 'htop'
tmux select-pane -t 0
tmux attach -t workspace
