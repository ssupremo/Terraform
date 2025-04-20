terraform {
  backend "azurerm" {
    resource_group_name  = "LHB-tfstate-RG"
    storage_account_name = "lhbtfstate"
    container_name       = "lhb-tfstate-container"
    key                  = "lhb.dev.tfstate"
  }
}