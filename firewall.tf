resource "upcloud_firewall_rules" "faasd" {
  server_id = upcloud_server.faasd.id

  firewall_rule {
    action                 = "accept"
    comment                = "Allow SSH from this network"
    destination_port_end   = "22"
    destination_port_start = "22"
    direction              = "in"
    family                 = "IPv4"
    protocol               = "tcp"
  }

  firewall_rule {
    action                 = "accept"
    comment                = "Allow HTTP from this network"
    destination_port_end   = "8080"
    destination_port_start = "8080"
    direction              = "in"
    family                 = "IPv4"
    protocol               = "tcp"
  }

  firewall_rule {
    action                 = "accept"
    comment                = "Allow HTTPS from this network"
    destination_port_end   = "443"
    destination_port_start = "443"
    direction              = "in"
    family                 = "IPv4"
    protocol               = "tcp"
  }
}