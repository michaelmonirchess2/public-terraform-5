resource "google_compute_url_map" "suboq_front_redirect" {
  default_url_redirect {
    https_redirect         = true
    redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
    strip_query            = false
  }

  description = "Automatically generated HTTP to HTTPS redirect for the ${var.project}-front forwarding rule"
  name        = "${var.project}-front-redirect"
  project     = var.project
}

resource "google_compute_url_map" "suboq_frontend_lb" {
  default_service = "https://www.googleapis.com/compute/v1/projects/${var.project}/global/backendServices/${var.project}-frontend"
  name            = "${var.project}-frontend-lb"
  project         = var.project
}

resource "google_compute_url_map" "suboq_frontend_redirect" {
  default_url_redirect {
    https_redirect         = true
    redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
    strip_query            = false
  }

  description = "Automatically generated HTTP to HTTPS redirect for the ${var.project}-frontend forwarding rule"
  name        = "${var.project}-frontend-redirect"
  project     = var.project
}

resource "google_compute_url_map" "suboq_lb" {
  default_service = "https://www.googleapis.com/compute/v1/projects/${var.project}/global/backendServices/${var.project}-lb-be-service"
  name            = "${var.project}-lb"
  project         = var.project
}