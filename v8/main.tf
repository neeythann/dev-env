terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

variable "hcloud_token" {
  type      = string
  sensitive = true
}

resource "hcloud_server" "server" {
  count       = 1
  name        = "${var.server_location}-dev-${count.index + 1}"
  server_type = "cpx51"
  image       = "debian-12"
  location    = var.server_location
  ssh_keys    = [hcloud_ssh_key.main.id]
  user_data   = file("./cloud_init.yaml")
}

variable "server_location" {
  type      = string
  sensitive = false
}

resource "hcloud_ssh_key" "main" {
  name       = "main"
  public_key = file("~/.ssh/id_ed25519.pub")
}

output "server_ip" {
  value = [
    for server in hcloud_server.server : {
      ipv4 = server.ipv4_address
      ipv6 = server.ipv6_address
    }
  ]
}
