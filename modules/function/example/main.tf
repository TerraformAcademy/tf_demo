module "fucntion-app" {
  source                     = "../../function"
  name                       = "my-function-app3"
  location                   = "East Us"
  resource_group_name        = "rg-loggly-poc-ann09-eus2"
  app_service_plan_id        = "/subscriptions/28e1f188-21a7-4ab2-8d0c-a2c92ee73c0e/resourceGroups/kotnalaweb-rg/providers/Microsoft.Web/serverfarms/ankitkotnala"
  storage_account_name       = "kotnalaa"
  storage_account_access_key = "iI3i6fUb0zUv8r8Dl0Hr6yeAzOkS/a26OlFYddrin2WKJs3GJasP4Ys4LlrBJHk46yE2n/IvOB1U+AStKm77Tw=="
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"    = "python"
  }
}

provider "azurerm" {
  features {}

}