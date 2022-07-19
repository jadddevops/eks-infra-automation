module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eks-vpc"
  cidr = "10.10.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.10.101.0/24", "10.10.102.0/24"]
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

