output "container_registry_name" {
  value = azurerm_container_registry.acr.name
}

output "acr_id" {
  value = azurerm_container_registry.acr.id
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "object_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}