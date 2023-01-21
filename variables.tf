variable "resource_group_prefix" {
  type = string
  default = "capstone"
}

variable "location" {
  type = string
  default = "eastus"
}

variable "container_registry_name" {
  type = string
  default = "capstoneprojectdemoacr"
}

variable "vm_size" {
  type = string
}

variable "node_count" {
  type = string
}

variable "sku" {
  type = string
}