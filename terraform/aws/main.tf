provider "aws" {
  region = "us-east-1"

}

module "keypair" {
  source = "./modules/key-pair"
}

module "vpc" {
  source                = "./modules/vpc"
  vpc_cidr              = "10.0.0.0/16"
  public_subnet_a_cidr  = "10.0.1.0/24"
  public_subnet_b_cidr  = "10.0.2.0/24"
  private_subnet_a_cidr = "10.0.3.0/24"
  private_subnet_b_cidr = "10.0.4.0/24"
  azure_vpn_public_ip   = "172.172.189.238"
  shared_secret         = "YourSuperSecretKey123"
  azure_vnet_cidr       = "20.0.0.0/16"
}

module "security_groups" {
  source           = "./modules/security_groups"
  vpc_id           = module.vpc.vpc_id
  my_ip            = "0.0.0.0/0" # my ip 
  vpc_cidr_block   = "10.0.0.0/16"
  azure_cidr_block = "20.0.0.0/16"
}

module "instances" {
  source                = "./modules/instances"
  ami_id                = "ami-0e2c8caa4b6378d8c" # current AMI ID
  instance_type         = "t2.medium"
  public_subnet_a_id    = module.vpc.public_subnet_a_id
  private_subnet_a_id   = module.vpc.private_subnet_a_id
  private_subnet_b_id   = module.vpc.private_subnet_b_id
  bastion_sg_id         = module.security_groups.bastion_sg_id
  private_sg_id         = module.security_groups.private_sg_id
  key_name              = module.keypair.keypairname
  public_subnet_a_cidr  = module.vpc.public_subnet_a_cidr
  public_subnet_b_cidr  = module.vpc.public_subnet_b_cidr
  private_subnet_a_cidr = module.vpc.private_subnet_a_cidr
  private_subnet_b_cidr = module.vpc.private_subnet_b_cidr

}


module "alb" {
  source   = "./modules/alb"
  subnets  = [module.vpc.public_subnet_a_id, module.vpc.public_subnet_b_id]
  sg_id    = module.security_groups.lb_sg_id
  alb_name = "app-alb"
  vpc_id   = module.vpc.vpc_id
}

module "tgs" {
  source   = "./modules/tgs"
  alb_name = module.alb.alb_name
  subnets  = [module.vpc.public_subnet_a_id, module.vpc.public_subnet_b_id]
  # sg_id               = module.security_groups.lb_sg_id
  vpc_id              = module.vpc.vpc_id
  instance_id_jenkins = module.instances.jenkins_instance_id
  instance_id_app1    = module.instances.app1_instance_id
  instance_id_app2    = module.instances.app2_instance_id
  alb_arn             = module.alb.alb_arn

}


// s3 code

# # Call the S3 bucket module
# module "s3_bucket" {
#   source      = "./modules/s3_bucket"
#   bucket_name = "test-bucket-s3-1234eus"
# }



# # Terraform backend configuration
# terraform {
#   backend "s3" {
#     bucket = module.s3_bucket.bucket_name
#     key    = "terraform/state.tfstate"
#     region = "us-east-1a"
#   }

# }
