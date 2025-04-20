module "resource_group" {
  source   = "../../modules/resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "virtual_network" {
  source              = "../../modules/virtual-network"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
  subnets             = var.subnets

  depends_on = [module.resource_group]
}

module "storage_account" {
  source = "../../modules/storage-account"

  storage_account_name    = var.storage_account_name
  resource_group_name     = var.resource_group_name
  location                = var.location
  account_tier            = var.account_tier
  account_replication_type = var.account_replication_type
  tags                    = var.tags

  depends_on = [module.resource_group]
}

module "container_registry" {
  source              = "../../modules/container-registry"
  acr_name            = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = var.admin_enabled
  tags                = var.tags

  depends_on = [module.resource_group]
}

module "private_dns_zone_postgresql" {
  source              = "../../modules/private-dns-zone"
  dns_zone_name       = "privatelink.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
  virtual_network_id  = module.virtual_network.virtual_network_id
  tags                = var.tags

  depends_on = [module.resource_group]
}

module "postgresql_flexible" {
  source = "../../modules/postgresql-flexible"

  name                   = var.postgresql_server_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  admin_username         = var.postgresql_admin_username
  admin_password         = var.postgresql_admin_password
  delegated_subnet_id    = module.virtual_network.subnet_ids["DB-Subnet"]
  private_dns_zone_id    = module.private_dns_zone_postgresql.private_dns_zone_id
  tags                   = var.tags

  depends_on = [
    module.virtual_network,
    module.private_dns_zone_postgresql
  ]
}

module "network_security_groups" {
  source              = "../../modules/network-security-group"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  depends_on = [module.virtual_network]

  nsgs = {
    "MGMT-Subnet-NSG" = {
      subnet_id = module.virtual_network.subnet_ids["MGMT-Subnet"]
    }
    "DB-Subnet-NSG" = {
      subnet_id = module.virtual_network.subnet_ids["DB-Subnet"]
    }
    "AI-Subnet-NSG" = {
      subnet_id = module.virtual_network.subnet_ids["AI-Subnet"]
    }
    "Redis-Subnet-NSG" = {
      subnet_id = module.virtual_network.subnet_ids["Redis-Subnet"]
    }
    "AKS-Subnet-NSG" = {
      subnet_id = module.virtual_network.subnet_ids["AKS-Subnet"]
    }
  }
}
