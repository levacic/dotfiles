#!/bin/bash
#
# Updates the Google Chrome launcher to force dark mode. Should be run after
# a Google Chrome update, and is only necessary in situations where Google
# Chrome doesn't natively pick up on the global dark mode configuration.
#
# Makes a backup copy first, and provides an easy-to-read diff afterwards to
# (manually) confirm the changes are correct.
#
# Relies on a hardcoded `/home/levacic/.local/bin/ydiff` program.
#
# Needs to be run as `sudo`.
#
# A suggestion is to make `~/bin/force-google-chrome-dark-mode` a symlink to
# this file for easier access.

today=$(date +%Y-%m-%d)
folder="/usr/share/applications"
shortcutfile="google-chrome.desktop"
backupfile="google-chrome.desktop.bak-$today"

cd "$folder"

if grep -q "\-\-force-dark-mode" "$shortcutfile"; then
    echo "Shortcut already contains the dark mode flag.";
    exit 0;
fi

cp "$shortcutfile" "$backupfile"

cat "$backupfile" | sed -e 's#Exec=/usr/bin/google-chrome-stable#Exec=/usr/bin/google-chrome-stable --force-dark-mode#' > "$shortcutfile"

diff -u "$backupfile" "$shortcutfile" | /home/levacic/.local/bin/ydiff

echo "\nFile updated, diff displayed above. If required, the backup is located in $folder/$backupfile"
