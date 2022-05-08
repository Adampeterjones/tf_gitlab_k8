## create deploy token
resource "gitlab_deploy_token" "gitlab_container_read" {
  project  = "containers-project" 
  name     = "Gitlab container read token"
  username = "container-reader"

  scopes = ["read_registry"]
}


resource "kubernetes_secret_v1" "gitlab-token" {
  metadata {
    name      = "gitlab-cfg"
    namespace = "workflow"
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "registry.gitlab.com" = {
          "username" = gitlab_deploy_token.gitlab_container_read.username
          "password" = gitlab_deploy_token.gitlab_container_read.token
          "auth"     = base64encode("${gitlab_deploy_token.gitlab_container_read.username}:${gitlab_deploy_token.gitlab_container_read.token}, auth: base64encode(${gitlab_deploy_token.gitlab_container_read.username}:${gitlab_deploy_token.gitlab_container_read.token}")
        }
      }
    })
  }
}
