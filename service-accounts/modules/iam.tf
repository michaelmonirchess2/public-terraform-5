resource "google_project_iam_member" "pubsub_token_creator_role" {
  project = var.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:${google_service_account.pubsub_invoker_sa.email}"
}

resource "google_project_iam_member" "functions_sa_iam" {
  for_each = toset([
    "roles/cloudfunctions.invoker",
    "roles/secretmanager.secretAccessor",
    "roles/logging.logWriter",
  ])
  role = each.key
  member = "serviceAccount:${google_service_account.functions_sa.email}"
  project = var.project
}

resource "google_project_iam_member" "pubsub_sa_iam" {
  for_each = toset([
    "roles/cloudfunctions.invoker",
  ])
  role = each.key
  member = "serviceAccount:${google_service_account.pubsub_invoker_sa.email}"
  project = var.project
}