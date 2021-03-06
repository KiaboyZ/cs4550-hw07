#!/bin/bash

export MIX_ENV=prod
export PORT=4793

CFGD=$(readlink -f ~/.config/events)

if [ ! -e "$CFGD/base" ]; then
    echo "run deploy first"
    exit 1
fi

SECRET_KEY_BASE=$(cat "$CFGD/base")
export SECRET_KEY_BASE

_build/prod/rel/events/bin/events start