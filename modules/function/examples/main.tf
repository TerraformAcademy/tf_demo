module "fucntion-app" {
  source = "../../function"
  name = "my-function-app"
  location = var.location
  resource_group_name = "RG001"
  app_service_plan_id = module.asp.id
  virtual_network_subnet_id = "ajkdhskdjakjd"
  create_private_endpoint = true
  pe_subnet_id = "kajshdkjasdhkd"
  zip_deploy_file = "code.zip"
}

module "asp" {
  source = "../modules/app_service_plan"
  name = "new-func-asp"
  location = "West Europe"
  resource_group_name = "rsg"
  kind = "Linux"
  reserved = false
  sku {
    tier = ""
    size = ""
  }
  tags = {}

}