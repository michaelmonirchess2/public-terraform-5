resource "google_service_account" "deployer" {
  account_id   = "deployer"
  display_name = "deployer"
  project      = var.project
}

resource "google_service_account" "functions_sa" {
    account_id = "functions-sa"
    display_name = "functions-sa"
    project = var.project
}

resource "google_service_account" "pubsub_invoker_sa" {
  account_id   = "pubsub-invoker-sa"
  display_name = "Pub/Sub Invoker Service Account"
  project = var.project
}