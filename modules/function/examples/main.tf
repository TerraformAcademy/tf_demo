module "fucntion-app" {
  source = "../../function"
  name = "my-function-app"
  location = "East US"
  resource_group_name = "RG001"
  virtual_network_subnet_id = "ajkdhskdjakjd"
  create_private_endpoint = true
  pe_subnet_id = "kajshdkjasdhkd"
  zip_deploy_file = "code.zip"

}