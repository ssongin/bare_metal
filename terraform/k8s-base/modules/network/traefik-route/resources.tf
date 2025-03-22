resource "kubectl_manifest" "selfsigned_certificate" {
  yaml_body = <<YAML
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
}

resource "kubectl_manifest" "traefik_ingress_route" {
  yaml_body  = <<YAML
apiVersion: traefik.io/v1alpha1
kind: IngressRoute
metadata:
  name: ${var.name}-ingress
  namespace: ${var.namespace}
spec:
  entryPoints:
  - websecure
  routes:
  - match: Host(`${var.hostname}`)
    kind: Rule
    services:
${join("\n", [for svc in var.services : "    - name: ${svc.name}\n      port: ${svc.port}"])}
  tls:
    secretName: ${var.name}-tls-secret
YAML
  depends_on = [kubectl_manifest.selfsigned_certificate]
}
