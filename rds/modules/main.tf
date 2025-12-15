provider "aws" {
   region = var.region  
}
   
resource "aws_db_instance" "my_rds" {
    engine               = var.engine
    engine_version       = var.engine_version
    instance_class       = var.instance_class
    allocated_storage    = 5
    db_name              = var.db_name
    username             = var.username
    password             = var.password
    db_subnet_group_name = aws_db_subnet_group.my_rds_subnet.name
    vpc_security_group_ids = var.vpc_security_group_ids
    publicly_accessible  = false
    skip_final_snapshot  = true

    tags = {
       Name = "jaya_rds"
    }
}

resource "aws_db_subnet_group" "my_rds_subnet" {
    name =  var.name
    subnet_ids = var.subnet_ids
}
