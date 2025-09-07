locals {
  project = "suboq-prod"
  region = "asia-northeast1"
  zone = "${local.region}-a"
  env = "prod"
}

module "lb" {
    source = "../../modules"
    project = local.project
    region = local.region
    environment = local.env
}