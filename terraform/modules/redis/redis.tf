resource "helm_release" "redis" {
  name  = "redis"
  chart = "redis"
  repository       = "https://charts.bitnami.com/bitnami"
  namespace        = "jenkins"
  timeout          = 300
  values = [
    "${file("./modules/redis/helm-values.yaml")}"
  ]
}