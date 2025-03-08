resource "kubectl_manifest" "metallb_ipaddresspool" {
  yaml_body = <<YAML
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: default-pool
  namespace: ${var.namespace}
spec:
  addresses: 
    - 192.168.10.100-192.168.10.200
YAML
}
# resource "kubernetes_manifest" "metallb_ipaddresspool" {
#   manifest = {
#     "apiVersion" = "metallb.io/v1beta1"
#     "kind"       = "IPAddressPool"
#     "metadata" = {
#       "name"      = "default-pool"
#       "namespace" = var.namespace
#     }
#     "spec" = {
#       "addresses" = ["192.168.10.100-192.168.10.200"]
#     }
#   }
# }
resource "kubectl_manifest" "metallb_l2advertisement" {
  yaml_body = <<YAML
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: l2advertisement
  namespace: ${var.namespace}
YAML
}
# resource "kubernetes_manifest" "metallb_l2advertisement" {
#   manifest = {
#     "apiVersion" = "metallb.io/v1beta1"
#     "kind"       = "L2Advertisement"
#     "metadata" = {
#       "name"      = "l2advertisement"
#       "namespace" = var.namespace
#     }
#   }
# }
