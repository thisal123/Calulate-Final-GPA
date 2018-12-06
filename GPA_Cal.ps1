#Purpose = GPA calculator for CSN batch in Powershell
#Developer = Janarthanan
#Date = 30th November 2018
#Version = 1

write-host "`n`n"
Write-Host "         GPA Calculator         "

write-host "`n"

$location=Read-Host "Give the location of CSV File Eg-[D:\gpa.csv]"

$results = Import-CSV $location

$tasks=1..5
$i=0
$t=0
[int]$tot_cre=0
$final=1..8

foreach ($a in $results)
{
$res=$a.Results
$cre=$a.Credits
$sub=$a.Subjects

if (($res -eq "A") -or ($res -eq "A+"))
{
$ans=4*$cre
}

elseif ($res -eq "A-")
{
$ans=3.7*$cre
}

elseif ($res -eq "B+")
{
$ans=3.3*$cre
}

elseif ($res -eq "B")
{
$ans=3*$cre
}

elseif ($res -eq "B-")
{
$ans=2.7*$cre
}

elseif ($res -eq "C+")
{
$ans=2.3*$cre
}

elseif ($res -eq "C")
{
$ans=2*$cre
}

elseif ($res -eq "C-")
{
$ans=1.7*$cre
}

elseif ($res -eq "D+")
{
$ans=1.3*$cre
}

elseif ($res -eq "D")
{
$ans=1*$cre
}

elseif ($res -eq "E")
{
$ans=0*$cre
}

#Assigning to array
$tasks[$i]=$ans

#Total credits for the semester
$tot_cre=$tot_cre+$cre

$i++

#write-host "$sub = $ans"

#For Research Project = Semester 8
if ($sub -eq "CDAP")
{
$final[7]=$ans/20
}

if ($i -eq 5)
{
$i=0
$total=$tasks[0]+$tasks[1]+$tasks[2]+$tasks[3]+$tasks[4]

$final[$t]=$total/$tot_cre

$tot_cre=0
$t++
}

}

write-host ""
Write-host "1st Semester GPA is $($final[0])"
Write-host "2nd Semester GPA is $($final[1])"
Write-host "3rd Semester GPA is $($final[2])"
Write-host "4th Semester GPA is $($final[3])"
Write-host "5th Semester GPA is $($final[4])"
Write-host "6th Semester GPA is $($final[5])"
Write-host "7th Semester GPA is $($final[6])"
Write-host "8th Semester GPA is $($final[7])"

write-host""
write-host "Semester 7 is for all 5 subjects taken in final year"
write-host "Semester 8 is for Final Research Project"
$cgpa=(($final[0])+($final[1])+($final[2])+($final[3])+($final[4])+($final[5])+($final[6])+($final[7]))/8

$wgpa=((($final[2])*0.1)+(($final[3])*0.1)+(($final[4])*0.15)+(($final[5])*0.15)+(($final[6])*0.25)+(($final[7])*0.25))


write-host "`n"

write-host "CGPA = $cgpa"
write-host "`n"
write-host "WGPA = $wgpa"
write-host "`n"
write-host "                Life is not about GPA !!!!!!!!!!!!!!"