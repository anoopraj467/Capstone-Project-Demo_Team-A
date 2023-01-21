resource "azurerm_kubernetes_cluster" "aks" {
  name                             = var.cluster_name
  location                         = var.location
  resource_group_name              = var.resource_group_name
  http_application_routing_enabled = true
  dns_prefix                       = "capstone-aks"

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "aks"
  }
}