resource "helm_release" "nexus" {
  name             = "nexus"
  repository       = "https://sonatype.github.io/helm3-charts/"
  chart            = "nexus-repository-manager"
  version          = "34.1.0"
  create_namespace = true
  namespace        = "nexus"
  timeout          = 600
  /*values = [
    "${file("./modules/nexus/helm-values.yaml")}"
  ]*/
}