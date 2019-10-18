variable "gcp_credentials" {
  type        = string
  description = "GCP JSON service account with escaped new lines in base64 format."
}

variable "vpc_name" {
  type        = string
  description = "VPC name."
}
