#!/bin/bash

# Show arguments if none entered
if [ $# -eq 0 ]; then
    echo "Usage: `basename $0` x.x.x.x"
    exit 0
fi

ping $1 | while read pong; do echo "$(date +%F\ %T) -- $pong" ; done
