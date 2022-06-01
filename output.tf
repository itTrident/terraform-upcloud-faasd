output "faasd_server_username" {
  value = var.instance_username
}

output "faasd_server_ip" {
  value = upcloud_server.faasd.network_interface[0].ip_address
}

output "gateway_url" {
  description = "The url of the faasd gateway"
  value       = var.domain == null || var.domain == "" ? format("http://%s:8080", upcloud_server.faasd.network_interface[0].ip_address) : format("https://%s", var.domain)
}

output "username" {
  value = var.basic_auth_user
}

output "password" {
  description = "Path of the Faasd password"
  value       = "/var/lib/faasd/secrets/basic-auth-password"
}