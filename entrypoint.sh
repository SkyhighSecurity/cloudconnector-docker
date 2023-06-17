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

if [ -z "${ACCEPT_TERMS}" ]; then
    echo "You must accept our terms and set the environment variable ACCEPT_TERMS to YES."
    exit 1
fi

if [ -z "${SKYHIGH_PORT}" ]; then
    echo "You must provide the port number for the server to listen on (8443 recommended)."
    exit 1
fi

if [ "$ACCEPT_TERMS" = "YES" ] || [ "$ACCEPT_TERMS" = "yes" ]; then

    if [ -d "/usr/local/shnlp/.install4j" ]; then
        # Log processor already installed, run it:
        echo "Log processor installation detected, starting service..."
        /usr/local/shnlp/shnlps_console
    else
        # New install
        chmod +x shnlp_unix64_6_3_2_2.sh
        chmod +x install.exp
        echo "First run detected, installing Skyhigh Cloud connector..."
        if expect ./install.exp; then
            echo "Install complete, starting service..."
            /usr/local/shnlp/shnlps_console
        else 
            echo "Installation failed.  See output above."
            exit 0
        fi
    fi

else

    echo "Terms of service not accepted, cannot continue.  (Set the ACCEPT_TERMS environment variable to YES)."
fi
