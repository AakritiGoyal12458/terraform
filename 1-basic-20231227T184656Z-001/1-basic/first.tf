# how to use aws cloud by TF
terraform {
  required_providers {
    myawscloud = {
      source  = "registry.terraform.io/hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

# auth to aws cloud
provider "myawscloud" {
	region     = "ap-south-1"

#	access_key = "AKIAQPYQMZ3WFLZ7WDCF"
#	secret_key = "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"
}

# manage use resources
# argument  (argument reference(key) = value)
# Block Name  "Resource Type" "Resource Local Name"

variable "amiId" {
	default = "ami-079b5e5b3971bd10d"
}

variable "osName" {
	default = "WelcomeOS2"
}



resource "aws_instance" "os1" {	
	ami = var.amiId 
	key_name = "key_terraform_training_key"
        vpc_security_group_ids = [ "sg-0cf9edcc7f3dff779" ]
	instance_type  =  "t2.micro"
	tags  =  {  
			Name = var.osName 
		}


	connection {
	    type     = "ssh"
	    user     = "ec2-user"
	    private_key = file("C:/Users/Vimal Daga/Downloads/key_terraform_training_key.pem")
	    host     = aws_instance.os1.public_ip
	  }



	provisioner "remote-exec" {
	    inline = [
	      "sudo yum install httpd -y",
	      "sudo touch /var/www/html/index.html",
	      "sudo systemctl enable httpd --now"
	    ]
	  }




}




resource "aws_ebs_volume" "myvol" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 1

  tags = {
    Name = "mywebvol"
  }
}


resource "aws_volume_attachment" "my_ebs_attach_ec2" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.myvol.id
  instance_id = aws_instance.os1.id
}


# attribute reference

output "Public_IP" {
  value = aws_instance.os1.public_ip
}

output "OS_state" {
  value = aws_instance.os1.instance_state
}


output "OS_AZ_name" {
  value = aws_instance.os1.availability_zone
}














