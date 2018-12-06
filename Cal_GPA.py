#Purpose = GPA calculator for CSN batch in Python
#Developer = Janarthanan
#Date = 30th November 2018
#Version = 1

#! python
import csv

print ("\n  GPA Calculator   \n")

location=input("Give the location of CSV File Eg-[D:\gpa.csv]")


#creating a list array with defined size of 5 to hold a semester subjects
semester=[]
for a in range(5):
	semester.append(a)

#creating a list array with defined size of 8 to hold each semester GPAs
final=[]
for a in range(8):
	final.append(a)

i=0
t=0
tot_cre=0

with open(location) as f:
	csv_reader= csv.reader(f)
	line_count=0
	for row in csv_reader:
		if (line_count != 0):
			sub=row[0]
			cre=int(row[1])
			res=row[2]
			
			if ((res == "A") | (res == "A+")):
				ans=4*cre
				
			elif (res == "A-"):
				ans=3.7*cre
				
			elif (res == "B+"):
				ans=3.3*cre
				
			elif (res == "B"):
				ans=3*cre
			
			elif (res == "B-"):
				ans=2.7*cre
				
			elif (res == "C+"):
				ans=2.3*cre
			
			elif (res == "C"):
				ans=2*cre
			
			elif (res == "C-"):
				ans=1.7*cre
			
			elif (res == "D+"):
				ans=1.3*cre
			
			elif (res == "D"):
				ans=1*cre
			
			elif (res == "E"):
				ans=0*cre
			
			semester[i]=ans
			
			tot_cre=tot_cre+cre
			
			i+=1
			
			if (sub == "CDAP"):
				final[7]=ans/20
				
			if (i == 5):
				i=0
				total=semester[0]+semester[1]+semester[2]+semester[3]+semester[4]
				final[t]=total/tot_cre
				
				tot_cre=0
				t+=1
				
				
			#print ("Subject "+sub+ " GPA is "+str(ans))
		
		line_count +=1
		

print ("\n1st semester GPA is "+ str(final[0]))
print ("2nd semester GPA is "+ str(final[1]))
print ("3rd semester GPA is "+ str(final[2]))
print ("4th semester GPA is "+ str(final[3]))
print ("5th semester GPA is "+ str(final[4]))
print ("6th semester GPA is "+ str(final[5]))
print ("7th semester GPA is "+ str(final[6]))
print ("8th semester GPA is "+ str(final[7]))

print ("\nSemester 7 is for all 5 subjects taken in final year")
print ("Semester 8 is for Final Research Project")

cgpa=(final[0]+final[1]+final[2]+final[3]+final[4]+final[5]+final[6]+final[7])/8

wgpa=((final[2]*0.1)+(final[3]*0.1)+(final[4]*0.15)+(final[5]*0.15)+(final[6]*0.25)+(final[7]*0.25))

print ("\nCGPA is "+str(cgpa))

print ("\nWGPA is "+str(wgpa))

print ("\n                Life is not about GPA !!!!!!!!!!!!!!")

		



