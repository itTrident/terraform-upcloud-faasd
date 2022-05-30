variable "username" {
  description = "Upcloud username for create the resource"
  type        = string
  default     = ""
}

variable "password" {
  description = "Upcloud password for create the resource"
  type        = string
  default     = ""
}

variable "hostname" {
  description = "Hostname for the server"
  type        = string
  default     = ""
}

variable "zone" {
  description = "Server zone"
  type        = string
  default     = ""
}

variable "plan" {
  description = "Server plan"
  type        = string
  default     = "1xCPU-1GB"
}

variable "instance_username" {
  description = "Username for instance to login to server"
  type        = string
  default     = ""
}

variable "ssh_public_key_path" {
  description = "Path to a SSH public key that you want to use for managing the server"
  type        = string
  default     = ""
}

variable "domain" {
  description = "Domain name for Faasd"
  type        = string
}

variable "email" {
  description = "Email for lets encrypt"
  type        = string
}

variable "basic_auth_user" {
  description = "OpenFaas username"
  type        = string
}

variable "basic_auth_password" {
  description = "OpenFaas login password"
  type        = string
}

#variable "firewall_rules" {
#  description = "List out the port number and protocol to allow in Firewall Rules"
#  type        = list(any)
#  default     = [{ protocol = "tcp", destination_port_end = "22", destination_port_start = "22", notes = "Allow SSH",  }, 
#                 { protocol = "tcp", destination_port_end = "8080", destination_port_start = "8080", notes = "Allow HTTP" }, 
#                 { protocol = "tcp", destination_port_end = "443", destination_port_start = "443", notes = "Allow HTTPS" }]
#}
