variable "name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "location" {
  description = "The Azure region where the Resource Group will be created"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resource group"
  type        = map(string)
  default     = {}
}
