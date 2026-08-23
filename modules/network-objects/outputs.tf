output "object_ids" {
  description = "Map of created object names to their UIDs"
  value = {
    dmz        = checkpoint_management_network.dmz.uid
    internal   = checkpoint_management_network.internal.uid
    management = checkpoint_management_network.management.uid
    web_server = checkpoint_management_host.dmz_web_server.uid
  }
}