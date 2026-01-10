provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "my_ec2" {
  for_each = tomap({
    jaya1-micro = "t3.micro"
    jaya2-small = "t3.small"
  })

  ami           = var.ami
  instance_type = each.value
  key_name      = var.key_name

  tags = {
    Name = each.key
    env  = var.env
  }
}
