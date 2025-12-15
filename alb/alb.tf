module "alb" {
  source = "./modules"
  region = "ap-south-2"
  name = "myapp-jaya"
  vpc_id = "vpc-0b601470de9f7e96a"
  public_subnets = [
    "subnet-00e6319a0a88945ee",
    "subnet-03fe18304f51a1530",
    ]
}
