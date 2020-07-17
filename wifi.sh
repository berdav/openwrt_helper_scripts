#!/bin/sh

# Manage wifi interface
# Copyright (C) 2020  Davide Berardi
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Crontab for root:
# # Power on wifi at 5 am
# 0 5 * * * /root/wifi.sh 1
# # Power off wifi at 1:45 am
# 45 1 * * * /root/wifi.sh 0

set -eu

if test "$1" == 1; then
	cmd=up
else
	cmd=down
fi

# Shutdown 5GHz and 2.4GHz interfaces
ip link set wlan0 ${cmd}
ip link set wlan1 ${cmd}

wifi "$cmd"
