resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "jenkins"
  version    = "8.0.14"
  namespace  = "jenkins"
  timeout    = 600
  values = [
    "${file("./modules/jenkins/helm-values.yaml")}"
  ]
}
