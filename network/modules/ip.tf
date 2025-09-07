resource "google_compute_address" "suboq_ext_ip" {
  address_type = "EXTERNAL"
  name         = "suboq-ext-ip"
  network_tier = "PREMIUM"
  project      = var.project
  region       = var.region
}

resource "google_compute_global_address" "suboq_dev_frontend_ip" {
  address_type = "EXTERNAL"
  ip_version   = "IPV4"
  name         = "${var.project}-frontend-ip"
  project      = var.project
}

resource "google_compute_global_address" "suboq_dev_ip" {
  address_type = "EXTERNAL"
  ip_version   = "IPV4"
  name         = "${var.project}-ip"
  project      = var.project
}

resource "google_compute_global_address" "suboq_ip_range" {
  address_type  = "INTERNAL"
  name          = "suboq-ip-range"
  network       = "suboq"
  prefix_length = 20
  project       = var.project
  purpose       = "VPC_PEERING"
}