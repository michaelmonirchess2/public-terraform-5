resource "google_vpc_access_connector" "suboq_vpc_connector" {
  machine_type   = "f1-micro"
  max_instances  = 3
  max_throughput = 300
  min_instances  = 2
  min_throughput = 200
  name           = "suboq-vpc-connector"
  project        = var.project
  region         = var.region

  subnet {
    name       = "suboq-subnet"
    project_id = var.project
  }
}