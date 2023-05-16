resource "azurerm_linux_function_app" "this" {
  name                       = var.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  service_plan_id            = var.app_service_plan_id
  daily_memory_time_quota    = var.daily_memory_time_quota
  builtin_logging_enabled    = var.builtin_logging_enabled
  enabled                    = var.enabled
  https_only                 = var.https_only
  storage_account_access_key = var.storage_account_access_key
  storage_account_name       = var.storage_account_name
  tags                       = var.tags
  virtual_network_subnet_id  = var.virtual_network_subnet_id

  dynamic "connection_string" {
    for_each = var.connection_string
    content {
      name  = connection_string.value["name"]
      type  = connection_string.value["type"]
      value = connection_string.value["value"]
    }
  }

  app_settings = var.app_settings

  dynamic "identity" {
    for_each = var.identity
    content {
      identity_ids = identity.value["identity_ids"]
      type         = identity.value["type"]
    }
  }

  dynamic "site_config" {
    for_each = var.site_config
    content {
      always_on                              = site_config.value["always_on"]
      api_definition_url                     = site_config.value["api_definition_url"]
      api_management_api_id                  = site_config.value["api_management_api_id"]
      app_command_line                       = site_config.value["app_command_line"]
      app_scale_limit                        = site_config.value["app_scale_limit"]
      application_insights_key               = site_config.value["application_insights_key"]
      application_insights_connection_string = site_config.value["application_insights_connection_string"]
      dynamic "application_stack" {
        for_each = site_config.value["application_stack"]
        content {
          dotnet_version              = application_stack.value.dotnet_version
          use_dotnet_isolated_runtime = application_stack.value.use_dotnet_isolated_runtime
          java_version                = application_stack.value.java_version
          node_version                = application_stack.value.node_version
          python_version              = application_stack.value.python_version
          powershell_core_version     = application_stack.value.powershell_core_version
          use_custom_runtime          = application_stack.value.use_custom_runtime
        }

      }
    }
  }

  zip_deploy_file = var.zip_deploy_file
}

resource "azurerm_private_endpoint" "this" {
  count               = var.create_private_endpoint ? 1 : 0
  name                = "${var.name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.pe_subnet_id
  private_service_connection {
    name                           = "${var.name}-psc"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_linux_function_app.this.id
    subresource_names = [
      "sites"
    ]
  }

}