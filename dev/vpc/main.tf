provider "aws" {
  region                    = "eu-west-2"
  alias                     = "eu-west-2"
  shared_credentials_file   = "~/.aws/credentials"
  profile                   = "snowco"
}

module "eu-west-2" {
  source = "../../modules/vpc"
  region = "eu-west-2"
  
  private_subnet_a = "10.0.1.0/24"
  private_subnet_b = "10.0.2.0/24"
  public_subnet_a = "10.0.255.0/24"
  public_subnet_b = "10.0.254.0/24"

  ssh_security_group = ["22"]
  web_security_group = ["80", "443"]

  app = "fargate-poc-vpc"
}

module "eu-west-1" {
  source = "../../modules/vpc"
  region = "eu-west-1"
  
  private_subnet_a = "10.0.1.0/24"
  private_subnet_b = "10.0.2.0/24"
  public_subnet_a = "10.0.255.0/24"
  public_subnet_b = "10.0.254.0/24"

  ssh_security_group = ["22"]
  web_security_group = ["80", "443"]

  app = "fargate-poc-vpc"
}
