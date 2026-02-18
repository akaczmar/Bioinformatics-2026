#!/bin/bash
#Assignment 3
#Andy Kaczmar

cd /home/arkaczmar/Desktop/

#1 Remove lines w/ "zoo" and print to panda_zoos.txt
sed '/zoo/Id' pandas.tsv >> panda_zoos.txt

#2 Sort pandas by sex. Print these into sorted_pandas.txt: name in Col 1, Age Col 2, Sex Col 3 
grep -w "female" pandas.tsv | awk '{print $1,$4,$2}' >> sorted_pandas.txt
grep -w "male" pandas.tsv | awk '{print $1,$4,$2}' >> sorted_pandas.txt

#3 Print alphabetical list of zoos/reserves to panda_zoos_A2Z.txt
grep -v "location" pandas.tsv | awk '{print $5}' | sort -u >> panda_zoos_A2Z.txt

#4 Replace all instances of "male" w/ "M" and "female" w/ "F" and print to panda_m_f.txt
# \b"word"\b = whole-word substitution for exact match
sed -e 's/\bmale\b/M/' -e 's/\bfemale\b/F/' pandas.tsv >> panda_m_f.txt

#5 Count females born in October
grep -w "female" pandas.tsv | grep -ic "october"

#6 Print pandas.tsv with line numbers appended as prefixes to panda_names.tsv
#Also removing the ":" symbol and replacing it w/ " "
grep -n "" pandas.tsv | sed 's/:/ /' >> panda_names.txt

#7 Prints lines 1, 6, and 17 to "lines_1_6_17.txt"
sed -n '1p;6p;17p' pandas.tsv >> lines_1_6_17.txt

#8 Print lines that contain upper or lowercase "x" to x_lines.txt
grep -i "x" pandas.tsv >> x_lines.txt

#9 Find location of pandas w/ unique locations where no other pandas are currently kept, and print these to unique_places.txt
# "NR>1" = skip "location" header in the first row
# Used sed to replace "Zoo_Atlanta w/ Atlanta_Zoo" 
# Sort alphabetically, then count how many times unique zoo name occurs, and only print the names that are counted once 
awk 'NR>1 {print $5}' pandas.tsv | sed 's/Zoo_Atlanta/Atlanta_Zoo/' | sort | uniq -c | awk '$1==1 {print $2}' >> unique_places.txt

#10 Sort panda ages youngest to oldest, only pandas age 10 and younger with their names in column 1 and ages in column 2. Print to young_pandas.txt
awk '$4 <= 10 {print $1,$4}' pandas.tsv | sort -k2,2n > young_pandas.txt
