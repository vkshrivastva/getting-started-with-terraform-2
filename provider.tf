provider "ibm" {
  ibmcloud_api_key = var.api_key
  region           = local.region
}
