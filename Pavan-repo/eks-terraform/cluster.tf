resource "aws_eks_cluster" "demo_eks" {
 name = "mydemo-cluster"
 role_arn = aws_iam_role.eks-iam-role.arn
 version  = "1.26"

 vpc_config {
    subnet_ids             = [var.subnet_id_1, var.subnet_id_2]
    security_group_ids     = [aws_security_group.mydemo_cluster_sg.id]
    endpoint_public_access = false
    endpoint_private_access = true
    public_access_cidrs    = ["0.0.0.0/0"]
  }

 depends_on = [
  aws_iam_role.eks-iam-role,
 ]
}