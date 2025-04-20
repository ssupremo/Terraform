variable "dns_zone_name" {
  description = "The name of the private DNS zone (e.g. privatelink.postgres.database.azure.com)"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "virtual_network_id" {
  description = "The ID of the virtual network to link"
  type        = string
}

variable "tags" {
  description = "Tags to apply to DNS zone and VNet link"
  type        = map(string)
}
