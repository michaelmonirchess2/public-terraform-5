resource "google_compute_target_http_proxy" "suboq_front_target_proxy" {
  name    = "${var.project}-front-target-proxy"
  project = var.project
  url_map = google_compute_url_map.suboq_front_redirect.self_link
}

resource "google_compute_target_http_proxy" "suboq_frontend_target_proxy" {
  name    = "${var.project}-frontend-target-proxy"
  project = var.project
  url_map = google_compute_url_map.suboq_frontend_redirect.self_link
}

resource "google_compute_target_https_proxy" "suboq_frontend_lb_target_proxy" {
  name          = "${var.project}-frontend-lb-target-proxy"
  project       = var.project
  quic_override = "NONE"

  # Keep as-is since the cert is created elsewhere
  ssl_certificates = [
    "https://www.googleapis.com/compute/v1/projects/${var.project}/global/sslCertificates/${var.project}-ssl-certificate"
  ]

  # Use resource reference to enforce creation order
  url_map = google_compute_url_map.suboq_frontend_lb.self_link
}

resource "google_compute_target_https_proxy" "suboq_lb_target_proxy" {
  name          = "${var.project}-lb-target-proxy"
  project       = var.project
  quic_override = "NONE"

  ssl_certificates = [
    "https://www.googleapis.com/compute/v1/projects/${var.project}/global/sslCertificates/${var.project}-ssl-certificate"
  ]

  url_map = google_compute_url_map.suboq_lb.self_link
}
