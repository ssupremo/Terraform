variable "nsgs" {
  description = "Map of NSG names and their corresponding subnet IDs"
  type = map(object({
    subnet_id = string
  }))
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "tags" {
  type    = map(string)
  default = {}
}
