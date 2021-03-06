#!/bin/bash

export MIX_ENV=prod
export PORT=4793
export SECRET_KEY_BASE=insecure
export DATABASE_URL=ecto://events:eidai4ein4Xo@localhost/events_prod

echo "Building..."

mix deps.get --only prod
mix compile

CFGD=$(readlink -f ~/.config/events)

if [ ! -d "$CFGD" ]; then
    mkdir -p "$CFGD"
fi

if [ ! -e "$CFGD/base" ]; then
    mix phx.gen.secret > "$CFGD/base"
fi

SECRET_KEY_BASE=$(cat "$CFGD/base")
export SECRET_KEY_BASE

npm install --prefix ./assets
npm run deploy --prefix ./assets
mix phx.digest

echo "Generating release..."
mix release

echo "Starting app..."

PROD=t ./start.sh
