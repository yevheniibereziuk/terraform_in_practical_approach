locals {
  #name = var.name
  name  = (var.name != "" ? var.name : random_id.id.hex)
  owner = var.team
  common_tags = {
    Owner       = local.owner
    DefaultUser = local.name
  }
}