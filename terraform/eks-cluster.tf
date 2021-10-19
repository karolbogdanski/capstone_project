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
      userarn = join("", [var.account_number, var.user1])
      username = var.user1
      groups = ["system:masters"]
      },
      {
      userarn = join("", [var.account_number, var.user2])
      username = var.user2
      groups = ["system:masters"]
      },
      {
      userarn = join("", [var.account_number, var.user3])
      username = var.user3
      groups = ["system:masters"]
      },
      {
      userarn = join("", [var.account_number, var.user4])
      username = var.user4
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
      bootstrap_extra_args          = "--enable-docker-bridge true"
    },

    {
      name                          = "worker-group-2"
      instance_type                 = "t2.medium"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      asg_desired_capacity          = 1
      bootstrap_extra_args          = "--enable-docker-bridge true"
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
