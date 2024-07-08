#!/bin/bash

if [[ $(pmset -g | grep ' sleep') =~ coreaudiod ]]; then
    echo audio is playing
fi
