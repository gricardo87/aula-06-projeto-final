terraform {
  required_version = ">=0.12"

  backend "azurerm" {
    resource_group_name  = "state-tf"
    storage_account_name = "statetfgr"
    container_name       = "tfstatepuc"
    key                  = "prod.terraform.tfstate"
  }

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {

  features {

  }

  #subscription_id   = "<subs-id>"
  #tenant_id         = "<tenant-id>"
  #client_id         = "<client-id>"
  #client_secret     = "<client-secret>"
}


