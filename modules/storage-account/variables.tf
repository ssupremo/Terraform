variable "storage_account_name" {
  type        = string
  description = "The name of the storage account"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group in which to create the storage account"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "account_tier" {
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  default     = "LRS"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
