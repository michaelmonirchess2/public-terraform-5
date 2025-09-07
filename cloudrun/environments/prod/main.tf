locals {
  project = "suboq-prod"
  region = "asia-northeast1"
  zone = "${local.region}-a"
}

module "cloudrun" {
    source = "../../modules"
    project = local.project
    region = local.region
}