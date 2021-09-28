terraform {
  source = "git::git@github.com:techotron/terraform-modules.git//modules/alb/?ref=main"
}

dependency "vpc" {
  config_path = "../vpc"
}

locals {
  environment = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  region      = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  vars_alb    = read_terragrunt_config(find_in_parent_folders("vars_alb.hcl"))
  vars_common = read_terragrunt_config(find_in_parent_folders("vars_common.hcl"))
  inputs      = merge(local.environment.locals, local.vars_alb.locals, local.region.locals, local.vars_common.locals)
}

include {
  path = find_in_parent_folders()
}

inputs = local.inputs