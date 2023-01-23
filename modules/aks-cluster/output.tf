output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "object_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}