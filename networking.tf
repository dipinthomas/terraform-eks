data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.1"

  name = var.vpcName
  cidr = "10.0.0.0/16"

  azs             = data.aws_availability_zones.available.names
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway   = true
  enable_dns_hostnames = true
  single_nat_gateway   = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = "prd"
    Owner       = "${var.tagOwner}"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.clusterIdentifier}" = "shared"
    "kubernetes.io/role/elb"                         = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.clusterIdentifier}" = "shared"
    "kubernetes.io/role/internal-elb"                = "1"
  }

}