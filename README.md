
# CSC4020F Assignment 1
# University of Cape Town
# Willie Macharia (MCHWIL006)

## Building, running a sample, cleaning

The assignemnt is made of 3 parts that is part 1, part 2 and part 3. 

The files are named as "Part"+questionnumber.hs  for example PartA_question1.hs means 
the question is in part A and is question 1

To run the files; invoke the command make run[PART][QUESTION NUMBER] 
example command make runA1 means run question 1 in part A.  see the makefile for details. 

Question C code is in QuestionC_question1.hs. The alogorithm used
to design the turing machine is mentioned and illustrated at the top of the file. Turing machine picture is also in palindrome.jpg file.

STEPS TO RUN QUESTION C: 

1.  To run it kindly run make runC1  
2.  Call function palindromeTM "ANYSTRING"   EXAMPLE BELOW

To verify the turing machine is working; try palindromeTM "ANYSTRING"
For example palindromeTM "ababa' returns 'a' meaning it is palindrome. 

For simulation of string "aba" see the table below and also open palindrome.jpg to see the steps shown.

| Step | <Current State,Input,output,Next state>| | input|output|
To run it; run make runC1 first and then ;

palndromeTM "aba"

| step 1 | <q0,a,u,q1> |    | "aba"| "_ba"| 
| step 2 | <q1,b,b,q1> |    | "_ba"| "_ba"| 
| step 3 | <q1,a,a,q1> |    | "_ba"| "_ba"| 
| step 4 | <q1,u,u,q2> |    | "_ba"| "_ba"| 
| step 5 | <q2,a,u,q3> |    | "_ba"| "_b_"| 
| step 6 | <q3,b,b,q3> |    | "_b_"| "_b_"| 
| step 7 | <q3,u,u,qo> |    | "_b_"| "_b_"| 
| step 8 | <q0,b,u,q4> |    | "___"| "___"| 
| step 9 | <q4,u,u,q5> |    | "___"| "___"| 
| step 10| <q5,u,u,q0> |    | "___"| "___"| 
| step 11| <q0,u,u,ACCEPT> |    ACCEPTED STRING

