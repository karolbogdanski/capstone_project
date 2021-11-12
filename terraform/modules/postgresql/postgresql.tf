resource "helm_release" "postgresql" {
  name             = "postgresql"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "postgresql"
  version          = "10.12.0"
  namespace        = "jenkins"
  timeout          = 300

  set {
    name  = "global.postgresql.postgresqlUsername"
    value = "postgres"
  }

  set {
    name  = "global.postgresql.postgresqlPassword"
    value = "postgres"
  }
}
