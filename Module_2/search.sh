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

punk='y'
while [ $punk != 'n' ]
do
	echo "Query:"
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

	grep -iE "\|.*$roll.*\| $name.*\| $dept.*\| $Prog.*\|.*$Hall.*\|.*$Email.*\|.*$coun.*\|.*$Gender.*" std_info2_sorted.txt
	echo ""
	echo "search again? (y/n)"

	read punk
done