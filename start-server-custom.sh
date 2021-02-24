#!/bin/bash

export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export STEAM_APP_ID=892970

WORLD_NAME=${WORLD_NAME:-Dedicated}
SERVER_NAME=${SERVER_NAME:-My Server}
PASSWORD=${SERVER_PASS:-secret}

echo "Starting server PRESS CTRL-C to exit"

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
./valheim_server.x86_64 -nographics -batchmode -name "${SERVER_NAME}" -port 2456 -world "${WORLD_NAME}" -password "${PASSWORD}"

export LD_LIBRARY_PATH=$templdpath