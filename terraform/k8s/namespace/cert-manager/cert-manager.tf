resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = var.helm_version

  namespace        = var.namespace
  create_namespace = true
  cleanup_on_fail  = true
  description      = "Cert-manager is a Kubernetes addon to automate the management and issuance of TLS certificates from various issuing sources."

  set = [
    {
      name  = "crds.enabled"
      value = "true"
    }
  ]

  # values = [
  #   templatefile("${path.module}/cm.values.yaml.tmpl", {
  #   })
  # ]
}

resource "kubectl_manifest" "selfsigned_cluster_issuer" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: selfsigned-cluster-issuer
spec:
  selfSigned: {}
YAML
}

