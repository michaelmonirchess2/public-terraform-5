locals {
  project = "suboq-prod"
  region  = "asia-northeast1"
  network = "suboq"
  zone    = "${local.region}-a"
}

module "secrets" {
  source  = "../../modules"
  project = local.project
}