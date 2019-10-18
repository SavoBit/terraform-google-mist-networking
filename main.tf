provider "google" {
  credentials = base64decode(var.gcp_credentials)
  project     = "mist-gcp-dev"
  #   region      = "us-east4"
  #   zone        = "us-east4-a"
}

resource "google_compute_network" "mist_vpc_network" {
  name                            = var.vpc_name
  description                     = "Cloud opearation mist VPC"
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
  delete_default_routes_on_create = false
}

# resource "google_compute_subnetwork" "k8s_network" {
#   name                     = "k8s-us-east4"
#   description              = "K8s subnetwork"
#   ip_cidr_range            = "10.1.0.0/20"
#   region                   = "us-east4"
#   network                  = google_compute_network.mist_vpc_network.self_link
#   enable_flow_logs         = true
#   private_ip_google_access = true
# }

# resource "google_compute_router" "router" {
#   name    = "mist-router"
#   region  = google_compute_subnetwork.k8s_network.region
#   network = google_compute_network.mist_vpc_network.self_link
#   bgp {
#     asn = 64514
#   }
# }

# resource "google_compute_router_nat" "mist_nat" {
#   name                               = "mist-nat-1"
#   router                             = google_compute_router.router.name
#   region                             = "us-east4"
#   nat_ip_allocate_option             = "AUTO_ONLY"
#   source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
# }

# resource "google_dns_managed_zone" "private_zone" {
#   name        = "mist-private-zone"
#   dns_name    = "gcp-dev-ue4.mist.pvt."
#   description = "Mist gcp-dev-ue4 private DNS zone"
#   labels = {
#     env = "gcp-dev-ue4"
#   }

#   visibility = "private"

#   private_visibility_config {
#     networks {
#       network_url = google_compute_network.mist_vpc_network.self_link
#     }
#   }
# }