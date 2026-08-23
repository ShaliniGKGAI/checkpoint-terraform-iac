# Synthetic "SK Corp" network segmentation
# Three zones: DMZ, Internal, Management

resource "checkpoint_management_network" "dmz" {
  name         = "net-dmz-${var.environment}"
  subnet4      = "10.10.10.0"
  mask_length4 = 24
  comments     = "SK Corp DMZ segment - hosts internet-facing services only"
}

resource "checkpoint_management_network" "internal" {
  name         = "net-internal-${var.environment}"
  subnet4      = "10.10.20.0"
  mask_length4 = 24
  comments     = "SK Corp Internal segment - workstations and internal servers, no direct internet exposure"
}

resource "checkpoint_management_network" "management" {
  name         = "net-mgmt-${var.environment}"
  subnet4      = "10.10.99.0"
  mask_length4 = 28
  comments     = "SK Corp Management segment - restricted to security/infra admin access only"
}

resource "checkpoint_management_host" "dmz_web_server" {
  name         = "host-web-${var.environment}"
  ipv4_address = "10.10.10.10"
  comments     = "Synthetic public-facing web server in SK Corp DMZ"
}