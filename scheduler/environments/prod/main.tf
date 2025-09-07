locals {
  project = "suboq-prod"
  region  = "asia-northeast1"
  network = "suboq"
  zone    = "${local.region}-a"
  env     = "prod"
}

module "scheduler" {
  source  = "../../modules"
  project = local.project
  region  = local.region
  zone    = local.zone
  env     = local.env
}