resource "azurerm_linux_function_app" "this" {
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  service_plan_id = var.app_service_plan_id
  # app_settings = var.app_settings
  daily_memory_time_quota = var.daily_memory_time_quota
  builtin_logging_enabled = var.builtin_logging_enabled
  enabled = var.enabled
  https_only = var.https_only
  storage_account_access_key = var.storage_account_access_key
  storage_account_name = var.storage_account_name
  storage_connection_string = var.storage_connection_string
  tags = var.tags
  virtual_network_subnet_id = var.virtual_network_subnet_id

  dynamic "connection_string" {
    for_each = var.connection_string
    content {
      name = connection_string.value["name"]
      type = connection_string.value["type"]
      value = connection_string.value["value"]
    }
  }

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE = 1
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      identity_ids = identity.value["identity_ids"]
      type = identity.value["type"]
    }
  }

  dynamic "site_config" {
    for_each = var.site_config
    content {
      always_on = site_config.value["always_on"]
      application_insights_key = site_config.value["application_insights_key"]
      application_insights_connection_string = site_config.value["application_insights_connection_string"]
    }
  }


  zip_deploy_file = var.zip_deploy_file
}

resource "azurerm_private_endpoint" "this" {
  count = var.create_private_endpoint == ture ? 1:0
  name                          = "${var.name}-pe"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  subnet_id                     = var.pe_subnet_id
  private_service_connection {
    name                           = "${var.name}-psc"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_function_app.this.id
    subresource_names = [
      "sites",
      "modules"
    ]
  }
  
}