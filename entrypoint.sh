#!/bin/bash
#Entrypoint script for enterprise connector installer

#Check that necessary envs are set
if [ -z "${SKYHIGH_USERNAME}" ]; then
    echo "Missing Skyhigh username.  Please set the environment variable SKYHIGH_USERNAME."
    exit 1
fi

if [ -z "${SKYHIGH_PASSWORD}" ]; then
    echo "Missing Skyhigh password.  Please set the environment variable SKYHIGH_PASSWORD."
    exit 1
fi

if [ -z "${SKYHIGH_SALT}" ]; then
    echo "Missing Skyhigh salt.  Please set the environment variable SKYHIGH_SALT."
    exit 1
fi

if [ -d "/usr/local/shnlp/.install4j" ]; then
    # Log processor already installed, run it:
    echo "Log processor installation detected, starting service..."
    /usr/local/shnlp/shnlps_console
else
    # New install
    chmod +x shnlp_unix64_6_3_2_2.sh
    echo "First run detected, installing Skyhigh Cloud connector..."
    expect ./install.expect $SKYHIGH_USERNAME $SKYHIGH_PASSWORD $SKYHIGH_SALT
    echo "Install complete, starting service..."
    /usr/local/shnlps_console
fi
