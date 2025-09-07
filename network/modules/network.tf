resource "google_compute_network" "suboq" {
  auto_create_subnetworks                   = false
  mtu                                       = 1460
  name                                      = "suboq"
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  project                                   = var.project
  routing_mode                              = "GLOBAL"
}