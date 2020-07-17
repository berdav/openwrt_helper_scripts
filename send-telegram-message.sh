#!/bin/sh

# Send a telegram message to a user using a bot.
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


set -eu

# Bot Token
TOKEN="$(cat token)"
# Chat with the target user
CHAT_ID="$(cat chat-id)"

send_message() {
	curl -H 'Content-type: application/json' \
		--data "{ \"chat_id\": \"$CHAT_ID\", \"text\": \"$1\" }" \
		"https://api.telegram.org/bot$TOKEN/sendMessage"
}

send_message "$1"
