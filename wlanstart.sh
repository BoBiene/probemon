#!/bin/bash -e

# Check if running in privileged mode
if [ ! -w "/sys" ] ; then
    echo "[Error] Not running in privileged mode."
    exit 1
fi

true ${INTERFACE:=wlan0}


# unblock wlan
rfkill unblock wlan
echo "Setting interface ${INTERFACE}"

iw dev ${INTERFACE} info
ip link set ${INTERFACE} down
iw ${INTERFACE} set monitor none
ip link set ${INTERFACE} up

LOCAL_MACS=$(ifconfig | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}' | paste -sd, -)

python3 /bin/probemon.py -i ${INTERFACE} --ignore-mac "${LOCAL_MACS}" $@

# ip link set ${INTERFACE} down
# iw ${INTERFACE} set type monitor