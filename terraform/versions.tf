terraform {
  required_version = ">= 1.0.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.9.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.30"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = ">=3.14.0"
    }
  }
}
