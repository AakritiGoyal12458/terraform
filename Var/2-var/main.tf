# x=5

# UDV - x
variable "x" {
	default = 5
}

#print(x)
#print("x")


output "your_answer_1_is" {
	value = "hi"
}

output "your_answer_2_is" {
	value = "hi this is ${var.x} bye"
}

