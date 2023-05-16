module "fucntion-app" {
  source                     = "../../function"
  name                       = "my-function-app3"
  location                   = "East Us"
  resource_group_name        = "rg-loggly-poc-ann09-eus2"
  app_service_plan_id        = "/subscriptions/28e1f188-21a7-4ab2-8d0c-a2c92ee73c0e/resourceGroups/kotnalaweb-rg/providers/Microsoft.Web/serverfarms/ankitkotnala"
  storage_account_name       = "xxxxx"
  storage_account_access_key = "xxxxx/xxxx/xxxxx+xxxxx=="
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"    = "python"
  }
}

provider "azurerm" {
  features {}

}