resource "ibm_is_vpc" "vpc" {
  name           = "${var.prefix}-vpc"
  resource_group = var.resource_group_id
}
