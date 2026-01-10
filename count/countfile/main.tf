provider "aws"{
    region = "ap-south-2"
}

resource "aws_instance" "my_ec2"{
  count = 2
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "jaya"
     env = var.env
 }
}
