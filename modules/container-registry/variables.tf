variable "acr_name" {
  type        = string
  description = "Name of the Azure Container Registry (ACR)"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for the ACR"
}

variable "sku" {
  type        = string
  description = "SKU of the ACR (Basic, Standard, Premium)"
  default     = "Basic"
}

variable "admin_enabled" {
  type        = bool
  description = "Enable admin user for ACR"
  default     = false
}

variable "tags" {
  type        = map(string)
  default     = {}
}