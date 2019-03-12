#!/bin/bash

# Copyright (C) 2019  tomvitale
#
# This file is part of nmapscan.
#
# nmapscan is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# nmapscan is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Nome-Programma.  If not, see <http://www.gnu.org/licenses/>.

# from first subnet IP to last one

subNet=192.168
fromNet=1
toNet=254

for ((i=$fromNet; i<=$toNet; i++))
do
  echo - - - SUBNET $subNet.$i.1 - - -
  nmap $subNet.$i.1/24 -n -sP | grep report | awk '{print $5}' > $subNet.$i.0_alive.txt
  # cat $subNet.$i.0_alive.txt
  echo finish scan $subNet.$i
  echo " "
  sleep 1s;
done
