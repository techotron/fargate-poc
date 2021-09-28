terraform {
  source = "git::git@github.com:techotron/terraform-modules.git//modules/vpc/?ref=v0.0.1"
}


locals {
  environment = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  region      = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  vpc_vars    = read_terragrunt_config(find_in_parent_folders("vpc_vars.hcl"))
  inputs      = merge(local.environment.locals, local.vpc_vars.locals, local.region.locals)
}

include {
  path = find_in_parent_folders()
}

inputs = local.inputs