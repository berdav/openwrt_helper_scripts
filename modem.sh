#!/bin/sh

# Manage power of USB ports (modem is attached to USB1 in this case).
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
# # Power on mobile connection at 5 am
# 0 5 * * * /root/modem.sh 1
# # Power off mobile connection at 1:45 am
# 45 1 * * * /root/modem.sh 0


set -eu
echo "$1" > '/sys/class/gpio/tp-link:power:usb1/value'
