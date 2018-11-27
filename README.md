# Latex Template Generator
Latex template generator personalized for use, supports both report and question-based assignment format.

## Usage
Export your name and student ID into env variables: `export STUDENTNAME='' && export STUDENTID=""`. Change the path names as to 
your preference when generating the template. To run it: `sh maketemplate.sh assignment|report evalnumber [qnumber]` where the 
first argument is if it's an assignment or a report, the second is the assignment/report number and the third is the number of 
questions if it's an assignment.
