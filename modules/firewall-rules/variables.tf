variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "network_objects" {
  description = "Output map from the network-objects module (zone UIDs)"
  type = object({
    object_ids = map(string)
  })
}