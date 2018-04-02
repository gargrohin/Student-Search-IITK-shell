#!/bin/bash

echo "IITK Student-Search"
echo ""
echo "example search:"
echo ""
echo "query format: "
echo "1. Roll (partial/complete)"
echo "2. Name"
echo "3. Dept"
echo "4. Programme"
echo "5. Hall/Room"
echo "6. IITK email"
echo "7. Gender"
echo "8. Country"
echo ""
echo "example search:"
echo ""
echo "(1)(160583) (2)(rohin) (3)(Electrical) (4)(T) (5)(Hall3) (6)(sronin) (7)(M) (8)(India)"
echo ""
echo "Query:"
echo ""

touch temp
cat std_info.txt>temp

punk='y'
while [ $punk != 'n' ]
do
	echo ""
	read query

	roll=`echo $query | grep -oE '\(1\)\([^)]*\)' | sed -E 's/\(1\)\((.*)\)/\1/g'`
	name=`echo $query | grep -oE '\(2\)\([^)]*\)' | sed -E 's/\(2\)\((.*)\)/\1/g'`
	dept=`echo $query | grep -oE '\(3\)\([^)]*\)' | sed -E 's/\(3\)\((.*)\)/\1/g'`
	Prog=`echo $query | grep -oE '\(4\)\([^)]*\)' | sed -E 's/\(4\)\((.*)\)/\1/g'`
	Hall=`echo $query | grep -oE '\(5\)\([^)]*\)' | sed -E 's/\(5\)\((.*)\)/\1/g'`
	Email=`echo $query | grep -oE '\(6\)\([^)]*\)' | sed -E 's/\(6\)\((.*)\)/\1/g'`
	Gender=`echo $query | grep -oE '\(7\)\([^)]*\)' | sed -E 's/\(7\)\((.*)\)/\1/g'`
	coun=`echo $query | grep -oE '\(8\)\([^)]*\)' | sed -E 's/\(8\)\((.*)\)/\1/g'`


	grep -iE -A 7 "Roll : $roll.*" temp>temp2
	cat temp2 >temp
	grep -iE -A 6 -B 2 "Name : $name" temp>temp2
	cat temp2 >temp
	grep -iE -A 5 -B 3 "Department : $dept" temp>temp2
	cat temp2 >temp
	grep -iE -A 4 -B 4 "Program : $Prog" temp>temp2
	cat temp2 >temp
	grep -iE -A 3 -B 5 "Hall : $Hall" temp>temp2
	cat temp2 >temp
	grep -iE -A 2 -B 6 "Email : $Email" temp>temp2
	cat temp2 >temp
	grep -iE -A 1 -B 7 "Gender : $Gender" temp>temp2
	cat temp2 >temp
	vim temp

	echo ""
	echo "successive filtering? (y/n)"
	read successive
	if [ $successive != 'y' ]
	then
		cat std_info.txt>temp
		echo "search again? (y/n)"
		read punk
	fi

done
rm temp temp2