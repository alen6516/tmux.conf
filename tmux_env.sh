#!/bin/bash
# ====================================================================

BASE="~/vm_share"
cd $BASE

tmux start-server

# new-session creates first window named 'workspace'
tmux new-session -d -s session1 -n workspace

# split window 'h'orizontally (into two vertical panes)
tmux split-window -t session1:workspace -h

# select the left-most pane
tmux last-pane

# split this pane 'v'ertically (into two horizontal panes)
tmux split-window -t session1:workspace -v

# start a vim editor in the left-most vertical pane
tmux send-keys -t session1:workspace.2 "cd $BASE; vim" C-m

# widen the vim editor pane by 30 cells
tmux resize-pane -L -t session1:workspace.2 30

# run guard -c clears shell after each change
tmux send-keys -t session1:workspace.0 "cd $BASE; top" C-m

# view some log
tmux send-keys -t session1:workspace.1 "cd $BASE; tail -f /var/log/auth.log" C-m

# select the vim pane in the workspace window
tmux select-window -t session1:workspace
tmux select-pane -t session1:workspace.2

# make the tmux session active
tmux attach-session -d -t session1
