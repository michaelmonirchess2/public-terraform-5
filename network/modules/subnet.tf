resource "google_compute_subnetwork" "suboq_subnet" {
  ip_cidr_range              = "10.124.0.0/28"
  name                       = "suboq-subnet"
  network                    = "suboq"
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = var.project
  purpose                    = "PRIVATE"
  region                     = var.region
  stack_type                 = "IPV4_ONLY"
}