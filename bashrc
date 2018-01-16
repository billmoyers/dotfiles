#!/bin/bash

SSH_AGENT_PIDS=()
SSH_AUTH_SOCKS=()

ssh-push() {
	SSH_AGENT_PIDS+=($SSH_AGENT_PID)
	SSH_AUTH_SOCKS+=($SSH_AUTH_SOCK)
	eval `ssh-agent -s`
}

ssh-pop() {
	if [[ "${#SSH_AGENT_PIDS[@]}" -ge 1 ]]; then
		eval `ssh-agent -k`
		export SSH_AGENT_PID=${SSH_AGENT_PIDS[0]}
		export SSH_AGENT_PIDS=${SSH_AGENT_PIDS:1}
		export SSH_AUTH_SOCK=${SSH_AUTH_SOCKS[0]}
		export SSH_AUTH_SOCKS=${SSH_AUTH_SOCKS:1}
	else
		echo No SSH agents in the stack.
		return 1
	fi
}

alias stmux='tmuxp load shell'
