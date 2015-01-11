#!/bin/sh 
#cd ~/enviroment/DIR1 && tmux new-session -d -s 'workspace1'\; split-window -p70 -v -c '~/enviroment/DIR1'\; split-window -v  -p50 -c '/var/log/mysql'\; 
#cd ~/enviroment/DIR2 && tmux new-session -d -s 'workspace2'\; split-window -p70 -v -c '~/enviroment/DIR2'\; split-window -v  -p50 -c '/var/log/mysql'\; 
#cd ~/enviroment/DIR3 && tmux new-session -d -s 'workspace3'\; split-window -p70 -v -c '~/enviroment/DIR3'\; split-window -v  -p50 -c '/var/log/mysql'\;

cd ~/enviroment/DIR1 && tmux new-session -d -s 'workspace1'\; split-window -p50 -h -c '~/enviroment/DIR1'\; split-window -v  -p50 -c '/var/log/mysql'\; 
cd ~/enviroment/DIR2 && tmux new-session -d -s 'workspace2'\; split-window -p50 -v -c '~/enviroment/DIR2'\; split-window -v  -p50 -c '/var/log/mysql'\; 
cd ~/enviroment/DIR3 && tmux new-session -d -s 'workspace3'\; split-window -p50 -v -c '~/enviroment/DIR3'\; split-window -v  -p50 -c '/var/log/mysql'\;
