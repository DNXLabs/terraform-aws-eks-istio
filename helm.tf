resource "helm_release" "istio_base" {
  count      = var.enabled && var.base_enabled ? 1 : 0
  name       = "istio-base"
  repository = var.helm_chart_repo
  chart      = "base"
  version    = var.helm_chart_version
  namespace  = var.namespace

  values = [
    yamlencode(var.base_settings)
  ]

}

resource "helm_release" "istiod" {
  count      = var.enabled && var.istiod_enabled ? 1 : 0
  name       = "istio-istiod"
  repository = var.helm_chart_repo
  chart      = "istiod"
  version    = var.helm_chart_version
  namespace  = var.namespace

  values = [
    yamlencode(var.istiod_settings)
  ]

}

resource "helm_release" "istio_ingressgateway" {
  count      = var.enabled && var.ingressgateway_enabled ? 1 : 0
  name       = "istio-ingressgateway"
  repository = var.helm_chart_repo
  chart      = "gateway"
  version    = var.helm_chart_version
  namespace  = var.namespace

  set {
    name  = "securityContext.fsGroup"
    value = 1337
  }

  set {
    name  = "securityContext.runAsGroup"
    value = 1337
  }

  set {
    name  = "securityContext.runAsNonRoot"
    value = true
  }

  set {
    name  = "securityContext.runAsUser"
    value = 1337
  }

  values = [
    yamlencode(var.ingressgateway_settings)
  ]

}