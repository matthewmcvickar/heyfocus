#!/bin/bash

hosts_file="/etc/hosts"
sites_to_block="sites-to-block"
start_token="# Begin list of sites to block while focusing."
end_token="# End list of sites to block while focusing."
restart_network="dscacheutil -flushcache"

# If distractions are already blocked, remove them.
if grep -Fxq "${start_token}" $hosts_file; then
    sed -ie "/${start_token}/,/${end_token}/d" $hosts_file
    $restart_network

# Otherwise, add the blocked sites to the hosts file.
else
    echo $start_token >> $hosts_file

    while read -r line; do
        # Ignore commented-out lines.
        [[ "$line" =~ ^#.*$ ]] && continue

        # Ignore blank lines.
        [[ -z "$line" ]] && continue

        # Write domains to the hosts file.
        echo "127.0.0.1\t${line}\twww.${line}" >> $hosts_file
    done < "${sites_to_block}"

    echo $end_token >> $hosts_file

    $restart_network
fi
