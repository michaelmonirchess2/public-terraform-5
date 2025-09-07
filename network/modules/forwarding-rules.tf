resource "google_compute_global_forwarding_rule" "suboq_frontend" {
  ip_address            = google_compute_global_address.suboq_dev_frontend_ip.self_link
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  name                  = "${var.project}-frontend"
  port_range            = "443-443"
  project               = var.project
  target                = "https://www.googleapis.com/compute/beta/projects/${var.project}/global/targetHttpsProxies/${var.project}-frontend-lb-target-proxy"
}

resource "google_compute_global_forwarding_rule" "suboq_frontend_forwarding_rule" {
  ip_address            = google_compute_global_address.suboq_dev_frontend_ip.self_link
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  name                  = "${var.project}-frontend-forwarding-rule"
  port_range            = "80-80"
  project               = var.project
  target                = "https://www.googleapis.com/compute/beta/projects/${var.project}/global/targetHttpProxies/${var.project}-frontend-target-proxy"
}

resource "google_compute_global_forwarding_rule" "suboq_front" {
  ip_address            = google_compute_global_address.suboq_dev_ip.self_link
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  name                  = "${var.project}-front"
  port_range            = "443-443"
  project               = var.project
  target                = "https://www.googleapis.com/compute/beta/projects/${var.project}/global/targetHttpsProxies/${var.project}-lb-target-proxy"
}

resource "google_compute_global_forwarding_rule" "suboq_front_forwarding_rule" {
  ip_address            = google_compute_global_address.suboq_dev_ip.self_link
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  name                  = "${var.project}-front-forwarding-rule"
  port_range            = "80-80"
  project               = var.project
  target                = "https://www.googleapis.com/compute/beta/projects/${var.project}/global/targetHttpProxies/${var.project}-front-target-proxy"
}
