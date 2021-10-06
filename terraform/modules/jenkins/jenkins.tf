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
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "jenkins"
  version    = "8.0.14"
  namespace  = "jenkins"
  //TODO check if it gets right when we wait a little longer
  timeout    = 240
  values = [
    "${file("./modules/jenkins/helm-values.yaml")}"
  ]
}
