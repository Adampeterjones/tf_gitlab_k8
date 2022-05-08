variable "aws_region" {
  default     = "eu-west-2"
  description = "AWS Region to deploy this API Gateway REST API"
  type        = string
}

variable "project_url" {
  description = "URL of the gitlab project that owns the resources"
  default     = "http://localhost"
  type        = string
}

variable "environment" {
  description = "bespoke account to deploy (i.e. dev, test, prod)"
  type        = string
}

variable "eks_cluster_name" {
  description = "eks cluster to deploy into"
  type        = string
}

variable "aws_account_id" {
  type        = string
  description = "AWS Account ID which may be operated on by this template"
}

variable "external_id" {
  description = "External identifier to use when assuming the role."
  type        = string
}

variable "resource_management_iam_role" {
  description = "Name of the role TF uses to manage resources in AWS accounts."
  type        = string
}

variable "manifest" {
  description = "manifest for deployment of containers"
  type        = map(any)
  default     = {}
}