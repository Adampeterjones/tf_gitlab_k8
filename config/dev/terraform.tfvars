aws_account_id = "123456789012" # dev


environment      = "dev"
eks_cluster_name = "eks-1"

manifest = {
  test-1 = {
      name            = "test-deploy-1"
      image           = "registry.gitlab.com/adams-test/containers/test-image-1:latest"
  }
  test-2 = {
      name            = "test-deploy-2"
      image           = "registry.gitlab.com/adams-test/containers/test-image-2:latest"
      }
}