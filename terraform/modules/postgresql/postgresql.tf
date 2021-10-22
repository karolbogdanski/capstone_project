resource "helm_release" "postgresql" {
  name             = "postgresql"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "postgresql"
  version          = "10.12.0"
  namespace        = "jenkins"
  timeout          = 300
  /*values = [
    "${file("./modules/jenkins/helm-values.yaml")}"
  ]*/
}
