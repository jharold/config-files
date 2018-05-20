#!/bin/bash

TMUX_PATH=/usr/bin/
SESSION_NAME=tmux

attach_tmux() {
  ${TMUX_PATH}tmux select-window -t 1
  ${TMUX_PATH}tmux attach-session -t $1
}

${TMUX_PATH}tmux ls 2> /dev/null
if [ $? -ne 1 ]
then
  attach_tmux ${SESSION_NAME}
else
  ${TMUX_PATH}tmux -2 new -d -s ${SESSION_NAME}
  for i in {1..4}; do
    ${TMUX_PATH}tmux new-window -n "$i"
  done
  attach_tmux ${SESSION_NAME}
fi
