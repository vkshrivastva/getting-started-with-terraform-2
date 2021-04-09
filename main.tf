locals {
  region = "us-south"
  zone   = "us-south-1"
  prefix = "training-tf"
}


/** 
# Data Source Example 
# Here we are using the Resource Group
*/

data "ibm_resource_group" "resource_group" {
  name = "ResrcGrp-Wes-davidng"
}

/** 
####################################################################################################################
                                  Module Section Starts here
####################################################################################################################
*/

module "vpc" {
  source            = "./modules/vpc"
  prefix            = local.prefix
  resource_group_id = data.ibm_resource_group.resource_group.id
}

module "sg" {
  source            = "./modules/sg"
  vpc               = module.vpc.id
  prefix            = local.prefix
  resource_group_id = data.ibm_resource_group.resource_group.id
  depends_on        = [module.vpc]
}

module "vsi" {
  source            = "./modules/vsi"
  vpc               = module.vpc.id
  prefix            = local.prefix
  resource_group_id = data.ibm_resource_group.resource_group.id
  zone              = local.zone
  sg_id             = module.sg.sg_id
  depends_on        = [module.vpc, module.sg]
}
