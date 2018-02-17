#! /bin/bash

echo "Enter roll"
read roll
#input roll number to search


curl https://oa.cc.iitk.ac.in/Oa/Jsp/OAServices/IITk_SrchRes.jsp\?typ\=stud\&numtxt\=$roll\&sbm\=Y >tmp1
# URL


awk '/: <\/b>/,/<\/p>/' tmp1 > tmp2
#tmp file for scraping usable information

awk '/Name: <\/b>/,/<\/p>/' tmp2 | cut -d \< -f-2 | cut -d \> -f2-
awk '/Program: <\/b>/,/<\/p>/' tmp2 | cut -d \< -f-2 | cut -d \> -f2-
awk '/Department: <\/b>/,/<\/p>/' tmp2 | cut -d \< -f-2 | cut -d \> -f2-
awk '/Info: <\/b>/,/<br>/' tmp2 | cut -d \< -f-2 | cut -d \> -f2-
grep "mailto" tmp2 | cut -d "\"" -f2 | cut -d ":" -f2-
echo  Email ":" em
#displaying the information

rm tmp1 tmp2
#removing the temp files
