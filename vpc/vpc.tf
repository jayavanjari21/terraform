module "vpc" {
  source = "./modules"
  region = "us-east-2"
  project                = "cdecb45"
  vpc_cidr_block         = "10.0.0.0/16"
  vpc_cidr_pub_subnet    = "10.0.1.0/24"
  vpc_cidr_pri_subnet    = "10.0.2.0/24"
}

