variable "vpc" {
  description = "Id of the VPC"
  type        = string
}

variable "prefix" {
  description = "Prefix text to pre pend with every resource"
  type        = string
}

variable "resource_group_id" {
  description = "ID of the resource group"
  type        = string
}

variable "zone" {
  description = "This is the zone name"
  type        = string
}
variable "sg_id" {
  description = "Security Group ID"
  type        = string
}

##############################################################################################################

variable "image" {
  default = "r006-78fafd7c-4fc6-4373-a58a-637ba6dc3ee8"
}

variable "profile" {
  default = "cx2-2x4"
}
variable "ssh_key" {
  default = "vks-mac-key"
}

