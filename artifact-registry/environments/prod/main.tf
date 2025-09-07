locals {
  project = "suboq-prod"
  region = "asia-northeast1"
  zone = "${local.region}-a"
}

module "artifact_registry" {
    source = "../../modules"
    project = local.project
    region = local.region
}