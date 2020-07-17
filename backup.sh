#!/bin/sh

# Helper to perform network backups
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

# invoke this script from ssh connection redirecting the output on a file.
# e.g. ssh $routerip backup.sh > backup-router-$(date +%s).tar

set -eu

# Require GNU tar
# Cat avoid check that the output goes to a terminal.
tar -cpv -f - \
	--exclude=/dev \
	--exclude=/proc \
	--exclude=/sys \
	--exclude=/tmp \
	--exclude=/overlay \
	--exclude=/var \
	/ | cat
