variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region for resources"
  type        = string
  default     = "koreacentral"
}

variable "tags" {
  description = "Tags to apply to the resource group"
  type        = map(string)
  default = {
    생성자       = "LHB"
  }
}

variable "vnet_name" {
  type        = string
  description = "Virtual Network name"
}

variable "address_space" {
  type        = list(string)
  description = "Virtual Network CIDR block"
}

variable "subnets" {
  description = "List of subnets to create in the VNet"
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "account_tier" {
  type        = string
  description = "The account tier for the storage account"
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "The replication type for the storage account"
  default     = "LRS"
}

variable "acr_name" {
  type        = string
  description = "Azure Container Registry name"
}

variable "acr_sku" {
  type        = string
  description = "SKU for the Azure Container Registry"
  default     = "Standard"
}

variable "admin_enabled" {
  type        = bool
  description = "Enable admin user for ACR"
  default     = true
}

variable "postgresql_server_name" {
  type        = string
  description = "PostgreSQL Flexible Server name"
}

variable "postgresql_admin_username" {
  type        = string
  description = "Admin username"
}

variable "postgresql_admin_password" {
  type        = string
  description = "Admin password"
  sensitive   = true
}
