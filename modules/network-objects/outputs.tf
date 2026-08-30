output "object_ids" {
  description = "Map of created object names to their IDs"
  value = {
    dmz        = checkpoint_management_network.dmz.id
    internal   = checkpoint_management_network.internal.id
    management = checkpoint_management_network.management.id
    web_server = checkpoint_management_host.dmz_web_server.id
  }
}
