resource_group_name = "LHB-RG"
vnet_name           = "LHB-Vnet"
storage_account_name = "lhbtestsa"
acr_name = "lhbtestacr"
postgresql_server_name     = "lhb-postgresql"
postgresql_admin_username  = "azureadmin"

tags = {
  생성자       = "이현빈"
}

address_space = ["10.0.0.0/16"]

subnets = [
  {
    name             = "MGMT-Subnet"
    address_prefixes = ["10.0.0.0/24"]
  },
  {
    name             = "DB-Subnet"
    address_prefixes = ["10.0.1.0/24"]
  }
  ,
  {
    name             = "AI-Subnet"
    address_prefixes = ["10.0.2.0/24"]
  }
  ,
  {
    name             = "Redis-Subnet"
    address_prefixes = ["10.0.3.0/24"]
  }
  ,
  {
    name             = "AKS-Subnet"
    address_prefixes = ["10.0.16.0/20"]
  }
]