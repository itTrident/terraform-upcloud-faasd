locals {
  generate_password   = var.basic_auth_password == null || var.basic_auth_password == ""
  basic_auth_user     = var.basic_auth_user
  basic_auth_password = local.generate_password ? random_password.faasd[0].result : var.basic_auth_password

  user_data_vars = {
    basic_auth_user     = local.basic_auth_user
    basic_auth_password = local.basic_auth_password
    domain              = var.domain
    email               = var.email
    
  }
}

resource "random_password" "faasd" {
  count            = local.generate_password ? 1 : 0
  length           = 16
  special          = true
  override_special = "_-#"
}

resource "upcloud_server" "faasd" {
  hostname  = var.hostname
  zone      = var.zone
  plan      = var.plan
  metadata  = true
  firewall  = true
  user_data = templatefile("${path.module}/template/startup.sh", local.user_data_vars)
  template {
    storage = "Ubuntu Server 20.04 LTS (Focal Fossa)"
    size    = 25
  }

  network_interface {
    type = "public"
  }

  login {
    user = var.instance_username
    keys = [
      chomp(file(var.ssh_public_key_path))
    ]
    create_password = false
  }
}