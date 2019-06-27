#!/bin/bash

while read line
do
yi=`echo $line | cut -d ',' -f 3`
mi=`echo $line | cut -d ',' -f 4`
di=`echo $line | cut -d ',' -f 5`

yf=`echo $line | cut -d ',' -f 6`
mf=`echo $line | cut -d ',' -f 7`
df=`echo $line | cut -d ',' -f 8`

#st=`echo $line | cut -d ',' -f 9`
#ll=`echo $line | cut -d ',' -f 9`
file="nl${yi}${mi}${di}"

sed "s/YEARI/$yi/g" template.input > $file
sed -i "s/MONTHI/$mi/g" $file
sed -i "s/DAYI/$di/g" $file
sed -i "s/YEARF/$yf/g" $file
sed -i "s/MONTHF/$mf/g" $file
sed -i "s/DAYF/$df/g" $file
#sed -i "s/STATUS/$st/g" $file

done < dates.csv

exit 0
