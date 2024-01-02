#variables are craeted for those values that keep on changing with time eg. os name , os ip ,etc. u need to identify acc to your code 
# x=5
# variables are of diff type : UDV:1. user defined variable , 2. internal system defined variable , 3. provider variables . 
# UDV - x

variable "x" {
	default = 5
}

#print(x) --> anything without " " : variable
#print("x") --> anything in " " is a string 


output "your_answer_1_is" {
	value = "hi"
}

output "your_answer_2_is" {
	value = "hi this is ${var.x} bye"
	#${var.x} : to use variable between the string : string intropolation 
}



/*
after completion of code to exeute teh file type terraform.exe apply in cmd . 
terraform apply -> promates us with a option of yes/no to make changes ...in order to make it non interactive w ecan use commannd 
terraform apply -auto-approve 
UDV:1. user defined variable : we can call them /give reference using var keyword eg var.x where v is a UDV. 
2. internal system defined variable : module
3. provider variables : any variable given by provider like aws cloud are calleld attribute references ...
at time of craeting code they are called key value pair . eg we have resource block and we gave name to that resource block along with varibale 
eg resource "aws_instace" "os1" { } this variable os1 store all teh attribute references

*/
