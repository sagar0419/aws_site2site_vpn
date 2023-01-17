# -------------------------------------------------------
#      PROVIDER
# -------------------------------------------------------
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# -------------------------------------------------------
#      TERRAFORM STATEFILE
# -------------------------------------------------------
# terraform {
#   backend "s3" {
#     bucket = "terraform-backup-sagar"
#     region = var.aws_region
#     key    = "backup.tfstate"
#   }
# }

#-----------------------------------------
#         CUSTOMER GATEWAY
#-----------------------------------------
module "customer_gateway" {
  source = "./module/customer_gateway"

  customer_gateway_1_ip   = var.customer_gateway_1_ip
  customer_gateway_1_name = var.customer_gateway_1_name
  customer_gateway_2_ip   = var.customer_gateway_2_ip
  customer_gateway_2_name = var.customer_gateway_2_name
}

#-----------------------------------------
#         SITE-TO-SITE-VPN
#-----------------------------------------
module "site_to_site_vpn" {
  source                  = "./module/site_to_site_vpn"
  vpc_id                  = var.vpc_id
  customer_gateway_1_name = var.customer_gateway_1_name
  customer_gateway_2_name = var.customer_gateway_2_name
  asl_1_customer_gateway  = module.customer_gateway.asl_1_customer_gateway
  asl_2_customer_gateway  = module.customer_gateway.asl_2_customer_gateway
}