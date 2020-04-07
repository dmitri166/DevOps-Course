provider helm {}

resource "helm_release" "prometheus_grafana" {

  name       = "prometheus-grafana"
  repository = "stable"
  chart      = "prometheus_grafana"
  timeout    = 1200

  values = [
    "${file("custom.yaml")}"
  ]

  set {
    name  = "prometheusOperator.createCustomResource"
    value = "false"
  }

}

