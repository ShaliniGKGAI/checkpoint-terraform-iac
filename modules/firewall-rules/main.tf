# SK Corp firewall rulebase
# Principle: deny-by-default, explicit least-privilege allows above it

resource "checkpoint_management_access_rule" "allow_internal_to_dmz_web" {
  name     = "allow-internal-to-dmz-web-${var.environment}"
  layer    = "Network"
  position = { top = "top" }

  source      = ["net-internal-${var.environment}"]
  destination = ["host-web-${var.environment}"]
  service     = ["https"]
  action      = "Accept"
  track       = "Log"
  comments    = "SK Corp: allow internal users to reach DMZ web server over HTTPS only"
}

resource "checkpoint_management_access_rule" "allow_mgmt_to_all" {
  name     = "allow-mgmt-admin-access-${var.environment}"
  layer    = "Network"
  position = { below = checkpoint_management_access_rule.allow_internal_to_dmz_web.name }

  source      = ["net-mgmt-${var.environment}"]
  destination = ["Any"]
  service     = ["ssh", "https"]
  action      = "Accept"
  track       = "Log"
  comments    = "SK Corp: management segment allowed admin access (SSH/HTTPS) for security operations"
}

resource "checkpoint_management_access_rule" "deny_all" {
  name     = "deny-all-default-${var.environment}"
  layer    = "Network"
  position = { bottom = "bottom" }

  source      = ["Any"]
  destination = ["Any"]
  service     = ["Any"]
  action      = "Drop"
  track       = "Log"
  comments    = "SK Corp: explicit deny-all baseline rule - default-deny posture, all traffic logged"
}