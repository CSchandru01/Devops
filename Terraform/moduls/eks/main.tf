
resource "aws_iam_role" "demo_role" {
    name = "demo-iam-role"
    
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
            Service = "eks.amazonaws.com"
            }
        }
        ]
    })
  
}

resource "aws_iam_role_policy_attachment" "cluster_policy_attachment" {
    role       = aws_iam_role.demo_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  
}

resource "aws_eks_cluster" "main" {
    name     = var.cluster_name
    version = var.eks_version
    role_arn = aws_iam_role.demo_role.arn

    vpc_config {
        subnet_ids = var.subnet_ids
    }

    depends_on = [
        aws_iam_role_policy_attachment.cluster_policy_attachment
        ]
}

resource "aws_iam_role" "node_role" {
    name ="${var.cluster_name}-node-role"
    
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
             Service = "ec2.amazonaws.com"
            }
        }
            ]
    })
}
resource "aws_iam_role_policy_attachment" "node_policy_attachment" {
    for_each = toset([
        "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
        "arn:aws:iam::aws:policy/amazonEKS_CNI_Policy",
        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    ])
    role       = aws_iam_role.node_role.name
    policy_arn = each.value
}

resource "aws_eks_node_group" "main" {
    for_each = var.node_groups

    cluster_name    = aws_eks_cluster.main.name
    node_group_name = each.key)
    node_role_arn   = aws_iam_role.node_role.arn
    subnet_ids      = var.subnet_ids    

    scaling_config {
        desired_size = var.node_group_desired_size
        max_size     = var.node_group_max_size
        min_size     = var.node_group_min_size
    }

    depends_on = [
        aws_iam_role_policy_attachment.node_policy_attachment
    ]
  
}