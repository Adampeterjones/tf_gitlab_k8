resource "kubernetes_deployment" "standard_worker_deployment" {
  for_each = var.manifest
  metadata {
    name      = each.value.name
    namespace = "workflow"
    labels = {
      test = each.value.name
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        test = each.value.name
      }
    }

    template {
      metadata {
        labels = {
          test = each.value.name
        }
      }

      spec {
        image_pull_secrets {
          name = kubernetes_secret_v1.gitlab-token.metadata[0].name #"gitlab-cfg"
        }
        # service_account_name = "eks-lambda"
        container {
          env {
            name  = "TEST_SERVER"
            value = "testserver.test.svc.cluster.local:7233"

          }
          image             = each.value.image
          name              = each.value.name
          image_pull_policy = "Always"

          security_context {
            allow_privilege_escalation = false
          }

          resources {
            limits = {
              cpu    = "200m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "100m"
              memory = "50Mi"
            }
          }
        }
      }

    }
  }
}