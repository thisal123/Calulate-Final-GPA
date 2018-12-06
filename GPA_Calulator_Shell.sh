#Purpose = GPA calculator for CSN batch in Shell
#Developer = Janarthanan
#Date = 30th November 2018
#Version = 1

#!/bin/bash
echo -e "GPA Calculator\n"

echo "Give the location of CSV File Eg-[D:\gpa.csv]"

read -r location

semester=(1 1 1 1 1)
i=0
t=0
tot_cre=0
final=(1 1 1 1 1 1 1 1)
count=0
ans=0

while IFS="," read sub cre myres
do

if [ $count -eq 0 ] 
then
count=$(($count+1))

else

	
	res=$(echo $myres | tr -d '\r')
	
	if [ $res == "A" ] || [ $res == "A+" ]
	then
	ans=$(echo |awk -v var="$cre" '{ print 4*var}')
	
	elif [ $res == "A-" ]
	then
	ans=$(echo |awk -v var="$cre" '{ print 3.7*var}')
	
	elif [ $res == "B+" ]
	then
	ans=$(echo |awk -v var="$cre" '{ print 3.3*var}')
	
	elif [ $res == "B" ]
	then
	ans=$(echo |awk -v var="$cre" '{ print 3*var}')
	
	elif [ $res == "B-" ]
	then
	ans=$(echo |awk -v var="$cre" '{ print 2.7*var}')
	
	elif [ $res == "C+" ]
	then
	ans=$(echo |awk -v var="$cre" '{ print 2.3*var}')
	
	elif [ $res == "C" ]
	then
	ans=$(echo |awk -v var="$cre" '{ print 2*var}')
	
	elif [ $res == "C-" ]
	then
	ans=$(echo |awk -v var="$cre" '{ print 1.7*var}')
	
	elif [ $res == "D+" ]
	then
	ans=$(echo |awk -v var="$cre" '{ print 1.3*var}')
	
	elif [ $res == "D" ]
	then
	ans=$(echo |awk -v var="$cre" '{ print 1*var}')
	
	elif [ $res == "E" ]
	then
	ans=$(echo |awk -v var="$cre" '{ print 0*var}')
	
	fi
	
	
	semester[$i]=$ans
	tot_cre=$(($tot_cre+$cre))
	
	
	i=$(($i+1))
	
	if [ "$sub" = "CDAP" ]
	then
		final[7]=$(echo |awk -v var1="$ans" '{ print var1/20}')
	fi
	
	
	if [ $i -eq 5 ]
	then
	i=0
	total=0
	for x in ${semester[@]}; do
	total=$(echo $total $x |awk '{ print $1 + $2}')
	done
	
	final[$t]=$(echo |awk -v var2="$total" -v var3="$tot_cre" '{ print var2/var3}')
	tot_cre=0
	t=$(($t+1))
	fi

fi

done < $location



echo "1st semester GPA is ${final[0]}"
echo "2nd semester GPA is ${final[1]}"
echo "3rd semester GPA is ${final[2]}"
echo "4th semester GPA is ${final[3]}"
echo "5th semester GPA is ${final[4]}"
echo "6th semester GPA is ${final[5]}"
echo "7th semester GPA is ${final[6]}"
echo "8th semester GPA is ${final[7]}"



echo -e "\nSemester 7 is for all 5 subjects taken in final year"
echo -e "Semester 8 is for Final Research Project"

total_cgpa=0
for y in ${final[@]}; do
total_cgpa=$(echo $total_cgpa $y |awk '{ print $1 + $2}')
done

cgpa=$(echo |awk -v var4="$total_cgpa" '{ print var4/8}')

echo -e "\n CGPA is $cgpa"

wgpa=$(echo |awk -v v1=${final[2]} -v v2=${final[3]}  -v v3=${final[4]}  -v v4=${final[5]}  -v v5=${final[6]}  -v v6=${final[7]} '{ print ((v1*0.1)+(v2*0.1)+(v3*0.15)+(v4*0.15)+(v5*0.25)+(v6*0.25))}')

echo -e "\n WGPA is $wgpa"

echo -e "\n                Life is not about GPA !!!!!!!!!!!!!!"
