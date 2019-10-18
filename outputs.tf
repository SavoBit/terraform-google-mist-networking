output "vpc_name" {
  value       = google_compute_network.mist_vpc_network.name
  description = "The name of the VPC."
  sensitive   = false
}