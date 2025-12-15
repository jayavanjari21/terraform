module "aws_security_group"{
    source = "./modules"
    region = "ap-south-2"
    name = "jaya_sg"
    ami = "ami-0e7938ad51d883574"
    instance_type = "t3.micro"
    env = "dev"
    vpc_id = "vpc-0b601470de9f7e96a"
}
