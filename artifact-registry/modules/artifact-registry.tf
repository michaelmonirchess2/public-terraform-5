resource "google_artifact_registry_repository" "suboq_artifact_registry" {
  cleanup_policy_dry_run = true
  format                 = "DOCKER"
  location               = var.region
  mode                   = "STANDARD_REPOSITORY"
  project                = var.project
  repository_id          = var.project
  docker_config {
    immutable_tags = false
  }
}