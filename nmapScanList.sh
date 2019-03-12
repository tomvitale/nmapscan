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

for var in "$@"
do
   echo " "
   echo "_ _ _ Scan IP from: $var _ _ _"
   filelines=`cat $var`

   echo -e "File: $var\n$filelines\n \n" > $var\_scan.txt

   for line in $filelines
   do
      echo ". start scan $line"
      echo "_ _ _ _ _ scan $line _ _ _ _ _" >> $var\_scan.txt
      nmap -A -T4 $line >> $var\_scan.txt
      #nmap -T4 $line
      echo -e ". finish scan"
      echo -e "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _\n" >> $var\_scan.txt
      sleep 1s;
   done    

done
