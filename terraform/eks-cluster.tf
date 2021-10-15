module "eks" {
  source               = "terraform-aws-modules/eks/aws"
  cluster_name         = local.cluster_name
  cluster_version      = "1.20"
  subnets              = module.vpc.private_subnets
  permissions_boundary = "arn:aws:iam::113304117666:policy/DefaultBoundaryPolicy"

  tags = {
    Environment = "training"
    GithubRepo  = "terraform-aws-eks"
    GithubOrg   = "terraform-aws-modules"
    Owner       = "pdrabicki"
    Project     = "capstone-10.21"
  }

  map_users = [ 
      {
      userarn = abc
      username = abc
      groups = ["system:masters"]
      },
      {
      userarn = abc
      username = abc
      groups = ["system:masters"]
      },
      {
      userarn = abc
      username = abc
      groups = ["system:masters"]
      },
      {
      userarn = abc
      username = abc
      groups = ["system:masters"]
      }
   ]

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t2.small"
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },

    {
      name                          = "worker-group-2"
      instance_type                 = "t2.medium"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      asg_desired_capacity          = 1
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
