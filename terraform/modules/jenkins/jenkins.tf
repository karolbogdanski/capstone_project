resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.helm.sh/stable"
  chart      = "jenkins"
  version    = "2.0.1"
  namespace  = "jenkins"
  timeout    = 600
  values = [
    "${file("helm-values.yaml")}"
  ]
}