locals {
  project = "suboq-prod"
  region  = "asia-northeast1"
  network = "suboq"
  zone    = "${local.region}-a"
  env     = "prod"
}

module "secrets" {
  source  = "../../modules"
  project = local.project
  env     = local.env
}
