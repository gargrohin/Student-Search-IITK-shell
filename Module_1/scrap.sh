#!/bin/bash

departments=('AE' 'BSBE' 'CHE' 'CHM' 'CE' 'CGS' 'CSE' 'ES' 'ECO' 'ECON' 'EE' 'MCH' 'EEM' 'HSS' 'IME' 'LT' 'DES' 'MSE' 'MSP' 'MATH' 'ME' 'MTH' 'NET' 'PHY' 'STAT')

touch std_info.txt
touch temp

for de in ${departments[*]}
do
	rec='0'
	curl "https://oa.cc.iitk.ac.in/Oa/Jsp/OAServices/IITk_SrchStudRoll.jsp?recpos=${rec}&selstudrol=&selstuddep=${de}&selstudnam=" > temp
	
	total=`cat temp | egrep -iA3 'you are viewing' | sed -nE '$p' | sed -E 's/[^0-9]*([0-9]+).*/\1/'`
	#echo $total
	
	while [ $rec -le $total ]
	do
		curl "https://oa.cc.iitk.ac.in/Oa/Jsp/OAServices/IITk_SrchStudRoll.jsp?recpos=${rec}&selstudrol=&selstuddep=${de}&selstudnam=" > temp

		for roll in `cat temp | grep -Eo 'numtxt=(.*)&amp' | sed -E 's/numtxt=(.*)&amp/\1/'`
		do
			curl "https://oa.cc.iitk.ac.in/Oa/Jsp/OAServices/IITk_SrchRes.jsp?typ=stud&numtxt=${roll}&sbm=Y" > temp

			Name=`cat temp | egrep -iA1 '<b>.*Name.*</b>' | sed -n '$p' | egrep -o '[^[:space:]].*[^[:space:]]'`

			Gender=`cat temp | egrep -iA1 '<b>.*Gender.*</b>' | sed -n '$p' | egrep -o '[^[:space:]].'`

			Department=`cat temp | egrep -iA1 '<b>.*Department.*</b>' | sed -n '$p' | egrep -o '[^[:space:]].*[^[:space:]]'`

			Program=`cat temp | egrep -iA1 '<b>.*Program.*</b>' | sed -n '$p' | egrep -o '[^[:space:]].*[^[:space:]]'`

			Hostel=`cat temp | egrep -iA1 '<b>.*Hostel Info.*</b>' | sed -n '$p' | egrep -o '[^[:space:]].*[^[:space:]]'`

			EMail=`cat temp | grep -ioE 'mailto:(.*)\">' | sed -E 's/mailto:(.*)\">/\1/g'`

			Nat=`cat temp | egrep -iA1 '<b>.*Country.*</b>' | sed -n '$p' | egrep -o '[^[:space:]].*[^[:space:]]'`

			#echo "|" $roll "|" $Name "|" $Department "|" $Program "|" $Hostel "|" $EMail "|"$Nat "|" $Gender  >> std_info.txt

			echo "__________________________________________________________________">> std_info.txt
			echo "Roll : $roll">> std_info.txt
			echo "Name : $Name">> std_info.txt
			echo "Department : $Department">>std_info.txt
			echo "Program : $Program">> std_info.txt
			echo "Hall : $Hostel">> std_info.txt
			echo "Email : $EMail">> std_info.txt
			echo "Nationality : $Nat">> std_info.txt
			echo "Gender : $Gender">> std_info.txt

		done
		rec=`expr $rec + 12`
		#echo $rec
	done
done
rm temp