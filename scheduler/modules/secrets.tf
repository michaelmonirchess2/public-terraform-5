resource "random_password" "suboq_scheduler_secret" {
  length  = 32
  special = false
}
resource "google_secret_manager_secret" "suboq_scheduler_api_key" {
  project   = var.project
  secret_id = "suboq-scheduler-api-key"
  replication {
    auto {}
  }
}
resource "google_secret_manager_secret_version" "suboq_scheduler_secret_value" {
  secret      = google_secret_manager_secret.suboq_scheduler_api_key.id
  secret_data = random_password.suboq_scheduler_secret.result
}

data "google_secret_manager_secret_version" "suboq_scheduler_secret_value" {
  secret  = google_secret_manager_secret.suboq_scheduler_api_key.id
  version = google_secret_manager_secret_version.suboq_scheduler_secret_value.version
}
