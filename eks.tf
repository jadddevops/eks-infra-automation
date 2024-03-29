module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = "my-cluster"
  cluster_version = "1.22"

  cluster_endpoint_public_access  = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    disk_size      = 50
    instance_types = ["t2.medium"]
    key_name = "devops2-02"
  }

  eks_managed_node_groups = {
    blue = {
      min_size     = 0
      max_size     = 1
      desired_size = 0

      instance_types = ["t2.medium"]
    }
    green = {
      min_size     = 2
      max_size     = 2
      desired_size = 2

      instance_types = ["t2.medium"]
    }
  }


  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
