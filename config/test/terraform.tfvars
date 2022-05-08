aws_account_id = "120987654321" # test


environment      = "test"
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