output "network_name" {
  description = "The name of the Docker network"
  value       = docker_network.app_network.name
}

output "api_url" {
  value = "http://localhost:${var.api_port}"
}

output "adminer_url" {
  value = "http://localhost:${var.adminer_port}"
}