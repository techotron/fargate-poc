terraform {
  source = "../../modules/vpc"
}


locals {
  environment = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  variables   = read_terragrunt_config("variables.hcl")
  inputs      = merge(local.environment.locals, local.variables.locals)
}

include {
  path = find_in_parent_folders()
}

inputs = local.inputs