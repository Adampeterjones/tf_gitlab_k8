# THIS DATA SOURCE WILL RETURN, AMONG OTHER THINGS, YOUR ENDPOINT AND AND CA CERTIFICATE
data "aws_eks_cluster" "eks" {
  name = "${var.environment}-${var.eks_cluster_name}"
}

# THIS DATA SOURCE WILL RETURN, AMONG OTHER THINGS, YOUR API TOKEN
data "aws_eks_cluster_auth" "eks" {
  name = data.aws_eks_cluster.eks.name #--EKS Cluster Name
}

