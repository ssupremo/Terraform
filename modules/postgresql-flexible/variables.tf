variable "name" {
  description = "Name of the PostgreSQL Flexible Server"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for PostgreSQL server"
  type        = string
}

variable "admin_username" {
  description = "Admin username"
  type        = string
}

variable "admin_password" {
  description = "Admin password"
  type        = string
  sensitive   = true
}

variable "delegated_subnet_id" {
  description = "ID of the delegated subnet for PostgreSQL"
  type        = string
}

variable "private_dns_zone_id" {
  description = "ID of the Private DNS Zone"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
