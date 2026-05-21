#!/bin/bash

export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

cmd=$(compgen -c | sort -u | fzf --prompt="Run: " --reverse --border --ansi)

if [ -n "$cmd" ]; then
    if command -v setsid >/dev/null; then
        setsid -f "$cmd" >/dev/null 2>&1
    else
        nohup "$cmd" >/dev/null 2>&1 &
        disown
    fi
fi
