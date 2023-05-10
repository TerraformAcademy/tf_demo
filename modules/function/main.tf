resource "azurerm_linux_function_app" "this" {
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  service_plan_id = var.app_service_plan_id
  app_settings = var.app_settings
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
      auto_swap_slot_name = site_config.value["auto_swap_slot_name"]
      ftps_state = site_config.value["ftps_state"]
      health_check_path = site_config.value["health_check_path"]
      http2_enabled = site_config.value["http2_enabled"]
      ip_restriction = site_config.value["ip_restriction"]
      linux_fx_version = site_config.value["linux_fx_version"]
      min_tls_version = site_config.value["min_tls_version"]
      pre_warmed_instance_count = site_config.value["pre_warmed_instance_count"]
      scm_ip_restriction = site_config.value["scm_ip_restriction"]
      scm_type = site_config.value["scm_type"]
      scm_use_main_ip_restriction = site_config.value["scm_use_main_ip_restriction"]
      use_32_bit_worker_process = site_config.value["use_32_bit_worker_process"]
      websockets_enabled = site_config.value["websockets_enabled"]

      dynamic "cors" {
        for_each = site_config.value.cors
        content {
          allowed_origins = cors.value["allowed_origins"]
          support_credentials = cors.value["support_credentials"]
        }
      }

    }
  }
  zip_deploy_file = var.zip_deploy_file
}

resource "azurerm_private_endpoint" "this" {
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