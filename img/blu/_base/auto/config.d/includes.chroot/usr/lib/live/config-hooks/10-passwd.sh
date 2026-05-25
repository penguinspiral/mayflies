#!/usr/bin/env bash

set -euo pipefail

# The 'live-config' package does not expose an interface for setting the live user password
# Authors of the Debian Live project expect the use of a boot-time hook:
# https://live-team.pages.debian.net/live-manual/html/live-manual/customizing-run-time-behaviours.en.html

# Password creation via mkpasswd(1) (included with 'whois' package)
# Create password for chpasswd(8) ingestion (/etc/shadow)
# cspell:disable-next-line
chpasswd --encrypted <<< 'debian:$y$j9T$ZQOFkgZCebsmdxMWJXLbs0$E/ZJ4qzKa19817qDMUM9KpKtYfG08QZbsXOBAs2XoF0'
