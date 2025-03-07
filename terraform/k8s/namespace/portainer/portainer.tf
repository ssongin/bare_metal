resource "helm_release" "portainer" {
  name       = var.name
  repository = "https://portainer.github.io/k8s/"
  chart      = var.name

  namespace        = var.namespace
  create_namespace = true
  cleanup_on_fail  = true
  description      = "Portainer orchestration tool for kubernetes"


  values = [
    templatefile("${path.module}/${var.name}.values.yaml.tmpl", {
      ingress_class       = var.ingress_class_name
      paths               = var.portainer_ingress_paths
      hostname            = var.hostname
      ingress_annotations = var.portainer_ingress_annotations
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
  depends_on = [helm_release.portainer]
}


resource "kubectl_manifest" "portainer_ingress" {
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
                name: portainer
                port:
                  number: 9443
YAML
  depends_on = [kubectl_manifest.selfsigned_certificate]
}

