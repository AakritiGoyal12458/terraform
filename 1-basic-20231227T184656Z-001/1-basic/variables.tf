# manage use resources
# argument  (argument reference(key) = value)
# Block Name  "Resource Type" "Resource Local Name"

variable "amiId" {}

variable "osName" {}

variable "AWS_REGION" {}

variable "instance_type" {
	type = map
	default = {
		dev = "t2.micro"
		test = "t2.small"
		prod = "t2.large"
	}
}
