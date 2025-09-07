locals {
  project = "suboq-prod"
  region = "me-central1"
  zone = "me-central1-a"
}

module "database" {
    source = "../../modules"
    project = local.project
    region = local.region
    zone = local.zone
}