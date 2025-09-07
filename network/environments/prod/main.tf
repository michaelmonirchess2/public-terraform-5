locals {
  project = "suboq-prod"
  region = "asia-northeast1"
  network = "suboq"
  zone = "${local.region}-a"
}

module "network" {
    source = "../../modules"
    project = local.project
    region = local.region
}