data "ibm_is_ssh_key" "ssh_key_id" {
  name = var.ssh_key
}

resource "ibm_is_subnet" "subnet" {
  name                     = "${var.prefix}-subnet"
  vpc                      = var.vpc
  zone                     = var.zone
  total_ipv4_address_count = 8
  resource_group           = var.resource_group_id
}

resource "ibm_is_instance" "vsi" {
  name           = "${var.prefix}-vsi"
  vpc            = var.vpc
  zone           = var.zone
  keys           = [data.ibm_is_ssh_key.ssh_key_id.id]
  resource_group = var.resource_group_id
  image          = var.image
  profile        = var.profile

  primary_network_interface {
    subnet          = ibm_is_subnet.subnet.id
    security_groups = [var.sg_id]
  }
}

resource "ibm_is_floating_ip" "fip" {
  name           = "${var.prefix}-fip"
  target         = ibm_is_instance.vsi.primary_network_interface[0].id
  resource_group = var.resource_group_id
}

# output "ip" {
#   value = ibm_is_floating_ip.fip.address
# }

