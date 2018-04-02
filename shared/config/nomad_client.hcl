data_dir = "/opt/nomad/data"
bind_addr = "IP_ADDRESS"
name = "nomad@IP_ADDRESS"

# Enable the client
client {
  enabled = true
  options = {
    driver.raw_exec.enable = "1"
    docker.cleanup.image = false
  }
}

consul {
  address = "IP_ADDRESS:8500"
}

vault {
  enabled = true
  address = "VAULT_URL"
}
