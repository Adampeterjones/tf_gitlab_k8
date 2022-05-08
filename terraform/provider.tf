provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_account_id]
  assume_role {
    role_arn    = "arn:aws:iam::${var.aws_account_id}:role/${var.resource_management_iam_role}"
    external_id = var.external_id
  }
  default_tags {
    tags = {
      Project   = var.project_url
      Region    = var.aws_region
      ManagedBy = "Terraform"
    }
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.eks.token
  insecure               = false

}

data "aws_caller_identity" "current" {}

data "aws_caller_identity" "user" {}
