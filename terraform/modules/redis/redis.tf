resource "helm_release" "redis" {
  name  = "redis"
  chart = "bitnami/redis"
  repository       = "https://charts.bitnami.com/bitnami"
  namespace        = "jenkins"
  timeout          = 300
}