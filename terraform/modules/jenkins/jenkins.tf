/*
resource "kubernetes_namespace" "jenkins" {
  metadata {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      mylabel = "label-value"
    }

    name = "terraform-example-namespace"
  }
}
*/

resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.helm.sh/stable"
  chart      = "jenkins"
  version    = "2.0.1"
  namespace  = "jenkins"
  timeout    = 600
  values = [
    "${file("./modules/jenkins/helm-values.yaml")}"
  ]
}
