terraform {
  source = "git::git@github.com:techotron/terraform-modules.git//modules/vpc/?ref=main"
}


locals {
  environment = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  region      = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  vars_vpc    = read_terragrunt_config(find_in_parent_folders("vars_vpc.hcl"))
  vars_common    = read_terragrunt_config(find_in_parent_folders("vars_common.hcl"))
  inputs      = merge(local.environment.locals, local.vars_vpc.locals, local.region.locals, local.vars_common.locals)
}

include {
  path = find_in_parent_folders()
}

inputs = local.inputs