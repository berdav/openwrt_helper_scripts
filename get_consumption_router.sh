#!/bin/sh

# Retrieve usage data from Huawei E3372 modem
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

get_stats() {
	TARGET="$1"
	COOKIE="$2"
	curl "http://$TARGET/api/monitoring/traffic-statistics" \
	 -H "Cookie: $COOKIE" 2>/dev/null
}
get_cookie(){
	TARGET="$1"
	curl -vvv "http://$1/html/index.html" 2>&1 |
		awk -F '[:;]' '/Set-Cookie/{print $2}'
}
cookie=$(get_cookie "$TARGET")

uname -a
get_stats "$TARGET" "$cookie" |
	awk -F '[><]' \
		'/Total.*load/{
			printf("%s\t%.2fGiB\n", $2, $3 / 1024 / 1024 / 1024);
			sum += $3/1024/1024/1024
		}
		END{printf("TotalSum\t%.2fGiB\n", sum)}'
