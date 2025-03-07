resource "helm_release" "longhorn" {
  name       = var.name
  repository = "https://charts.longhorn.io"
  chart      = var.name
  version    = var.helm_version

  namespace        = var.namespace
  create_namespace = true
  cleanup_on_fail  = true
  description      = "Longhorn is a distributed block storage system for Kubernetes."

  values = [
    templatefile("${path.module}/${var.name}.values.yaml.tmpl", {
    })
  ]
}

resource "kubectl_manifest" "selfsigned_certificate" {
  yaml_body  = <<YAML
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: ${var.name}-tls
  namespace: ${var.namespace}
spec:
  secretName: ${var.name}-tls-secret
  duration: 8760h # 1 year
  renewBefore: 720h # 30 days before expiration
  issuerRef:
    name: selfsigned-cluster-issuer
    kind: ClusterIssuer
  commonName: ${var.hostname}
  dnsNames:
    - ${var.hostname}
    - www.${var.hostname}
YAML
  depends_on = [helm_release.longhorn]
}


resource "kubectl_manifest" "longhorn_ingress" {
  yaml_body  = <<YAML
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ${var.name}-ingress
  namespace: ${var.namespace}
  annotations:
    cert-manager.io/cluster-issuer: "selfsigned-cluster-issuer"
    traefik.ingress.kubernetes.io/router.entrypoints: "websecure"
spec:
  tls:
    - hosts:
        - ${var.hostname}
        - www.${var.hostname}
      secretName: ${var.name}-tls-secret
  rules:
    - host: ${var.hostname}
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: longhorn-frontend
                port:
                  number: 80
YAML
  depends_on = [kubectl_manifest.selfsigned_certificate]
}
