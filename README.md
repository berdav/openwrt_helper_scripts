# Openwrt helper scripts
Openwrt automation scripts I use in my home

I use this scripts on an Archer c7 v2 OpenWRT router.  They requires
tools present in the distribution by default and curl.

You can install curl using opkg:
```bash
$ opkg update
$ opkg install curl
```

This scripts in this repo are the following:
* `get_consumption_router.sh` Get data usage from an Huawei E3372
  USB dongle.

* `modem.sh` A script manage the power of the modem using cron the
  crontab line I use is in a comment in the source.

* `wifi.sh` Power on or off the wifi interface.

* `send-telegram-message.sh` Send a message via a telegram bot, first
  parameter is the message, it needs `chat-id`, a file containing the
  `chat-id` of the target and `token`, the token get from the botfather.

* `backup.sh` A script to do network backups using ssh.
