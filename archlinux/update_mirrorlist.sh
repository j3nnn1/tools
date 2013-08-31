#!/bin/bash

pacman -Sc && pacman-optimize
cp /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist.backup
sed '/^#\S/ s|#||' -i /etc/pacman.d/mirrorlist.backup
rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist

#reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist
