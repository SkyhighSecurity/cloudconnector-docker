#!/bin/bash
#Entrypoint script for enterprise connector installer
if [ -d "/usr/local/shnlp/.install4j" ]; then
    # Log processor already installed, run it:
    echo "Log processor installation detected, starting service..."
    /usr/local/shnlp/shnlps_console
else
    # New install
    echo "First run detected, installing Skyhigh Cloud connector..."
    cd /
    set timeout 300
    chmod +r shnlp_unix64_6_3_2_2.sh
    spawn ./shnlp_unix64_6_3_2_2.sh
    expect "OK [o, Enter], Cancel [c]\r"
    send -- "\r"
    expect "[/usr/local/shnlp]\r"
    send -- "\r"
    expect "Yes [y, Enter], No [n]\r"
    send -- "\r"
    expect "Yes [y, Enter], No [n]\r"
    send -- "\r"
    expect "[/usr/local/bin]\r"
    send -- "\r"
    expect "This machine can directly connect to the internet [1, Enter], This machine requires a proxy server to connect to the internet [2]\r"
    send -- "\r"
    expect "[]"
    send -- "$SKYHIGH_USERNAME\r"
    expect "Password:\r"
    send -- "$SKYHIGH_PASSWORD\r"
    expect "CAPROD [4]\r"
    send -- "\r"
    expect "Salt\r"
    send -- "$SALT\r"
    expect "Yes [y], No [n, Enter]\r"
    send -- "\r"
    expect "]\r"
    send -- "\r"
    expect "[8443]\r"
    send -- "\r"
    expect "Yes [y], No [n, Enter]\r"
    send -- "\r"
    expect "Enter]\r"
    send -- "\r"
    expect "Finishing installation ...\r"
    echo "Installation finished!"
    
fi
