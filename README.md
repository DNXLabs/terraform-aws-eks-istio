# terraform-aws-eks-external-secrets

[![Lint Status](https://github.com/DNXLabs/terraform-aws-eks-istio/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-eks-istio/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-eks-istio)](https://github.com/DNXLabs/terraform-aws-eks-istio/blob/master/LICENSE)

Terraform module for deploying [Kubernetes Istio](https://github.com/istio/istio), an open source service mesh that layers transparently onto existing distributed applications.

# Usage

```
module "istio" {
  source = "git::https://github.com/DNXLabs/terraform-aws-eks-istio.git?ref=0.0.1"

  enabled                = true
  istiod_enabled         = true
  ingressgateway_enabled = true

  create_namespace = true

}
```

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.13, < 4.0 |
| helm | >= 1.0, < 3.0 |
| kubernetes | >= 1.10.0, < 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| helm | >= 1.0, < 3.0 |
| kubernetes | >= 1.10.0, < 3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| base\_enabled | Variable indicating whether Istio base CRDs are enabled. | `bool` | `true` | no |
| base\_settings | Additional settings which will be passed to the Istio Base Helm chart values. | `map` | `{}` | no |
| create\_namespace | Whether to create Kubernetes namespace with name defined by `namespace`. | `bool` | `true` | no |
| enabled | Variable indicating whether Istio is enabled. | `bool` | `true` | no |
| helm\_chart\_repo | Istio repository name. | `string` | `"https://istio-release.storage.googleapis.com/charts"` | no |
| helm\_chart\_version | Istio helm chart version. | `string` | `"1.13.3"` | no |
| ingressgateway\_enabled | Variable indicating whether Istio ingress gateway is enabled. | `bool` | `true` | no |
| ingressgateway\_settings | Additional settings which will be passed to the Istio Ingress Gateway Helm chart values. | `map` | `{}` | no |
| istiod\_enabled | Variable indicating whether istiod is enabled. | `bool` | `true` | no |
| istiod\_settings | Additional settings which will be passed to the Istio Discovery Helm chart values. | `map` | `{}` | no |
| namespace | Kubernetes namespace for Istio | `string` | `"istio-system"` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->
