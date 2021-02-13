#!/bin/sh

set -eu

opkg update
UPGRADABLE="$( opkg list-upgradable | awk '{print $1}')"

for pkg in ${UPGRADABLE}; do
	opkg upgrade "$pkg"
done
