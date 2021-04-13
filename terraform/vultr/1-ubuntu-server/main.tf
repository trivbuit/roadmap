# Version provider
terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.2.0"
    }
  }
}

# Remote backend, save state file. DONE!
terraform {
  backend "remote" {
    hostname     = "trivbuit.scalr.io"
    organization = "env-tct37d1oddo7u4g"

    workspaces {
      name = "R_Ubuntu_Server"
    }
  }
}

# Configure the Vultr Provider
provider "vultr" {
  api_key     = "api_key"
  rate_limit  = 700
  retry_limit = 3
}

# Add ssh-key
resource "vultr_ssh_key" "my_ssh_key" {
  name    = "my-ssh-key"
  ssh_key = file("id.pub")
}

# Create a web instance
resource "vultr_instance" "my_ubuntu" {

  plan   = "vc2-1c-1gb" #"1024 MB RAM,25 GB SSD,1.00 TB BW" 201
  region = "sgp"        #SGP - 40
  os_id  = "270"        #"Ubuntu 18.04 x64"

  label    = "my-ubuntu-label"
  tag      = "my-ubuntu-tag"
  hostname = "my-ubuntu-hostname"

  ssh_key_ids = ["${vultr_ssh_key.my_ssh_key.id}"]

  enable_ipv6      = true
  backups          = "enabled"
  activation_email = false
}

# Output
output "main_ip" {
  value = vultr_instance.my_ubuntu.main_ip
}

output "default_password" {
  value = vultr_instance.my_ubuntu.default_password
}