module "vpc" {
  source = "./modules/vpc"
  region = "ap-south-2"
  name = "jaya"
  vpc_id = "vpc-0b601470de9f7e96a"
  public_subnets = [
    "subnet-00e6319a0a88945ee",
    "subnet-03fe18304f51a1530",]
  project                = "cdecb45"
  vpc_cidr_block         = "172.0.0.0/16"
  vpc_cidr_pub_subnet    = "172.0.0.0/20"
  vpc_cidr_pri_subnet    = "172.0.16.0/20"
}
