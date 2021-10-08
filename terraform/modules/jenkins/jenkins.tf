resource "helm_release" "jenkins" {
  name             = "jenkins"
  repository       = "https://charts.jenkins.io"
  chart            = "jenkins"
  version          = "3.6.1"
  create_namespace = true
  namespace        = "jenkins"
  timeout          = 300
  values = [
    "${file("./modules/jenkins/helm-values.yaml")}"
  ]
  lint = true
}
