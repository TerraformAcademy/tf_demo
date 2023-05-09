module "eventhub" {
  source = "../../"
  name = "my-evnthub"
  resource_group_name = "testrsg"
  namespace_name = "namespace01"
  partition_count     = 2
  message_retention   = 1
}