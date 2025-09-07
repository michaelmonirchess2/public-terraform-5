locals {
  project = "suboq-prod"
  region = "asia-northeast1"
  zone = "${local.region}-a"
  id = "134526550709"
}

module "service_account" {
    source = "../../modules"
    project = local.project
    project_id = local.id
}