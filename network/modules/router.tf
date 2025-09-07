resource "google_compute_router" "suboq_router" {
  name    = "suboq-router"
  network = "https://www.googleapis.com/compute/v1/projects/${var.project}/global/networks/suboq"
  project = var.project
  region  = var.region
}