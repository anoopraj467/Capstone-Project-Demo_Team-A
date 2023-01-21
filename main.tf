resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_prefix}-rg"
  location = var.location

  tags = {
    environment = "aks"
  }
}

module "aks" {
  source = "./modules/aks-cluster"
  cluster_name = "${var.resource_group_prefix}-aks"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  node_count = "${var.node_count}"
  vm_size = "${var.vm_size}"
}

module "acr" {
  source = "./modules/acr"
  container_registry_name = "capstoneprojectdemoacr"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sku = "${var.sku}"
}

resource "azurerm_role_assignment" "role" {
  principal_id                     = module.aks.object_id
  role_definition_name             = "AcrPull"
  scope                            = module.acr.acr_id
  skip_service_principal_aad_check = true
}