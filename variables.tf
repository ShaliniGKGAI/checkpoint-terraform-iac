variable "checkpoint_server" {
  description = "IP or hostname of the Checkpoint Security Management Server"
  type        = string
  default     = ""
}

variable "checkpoint_username" {
  description = "API username for Checkpoint management (use a dedicated API user, not admin)"
  type        = string
  sensitive   = true
  default     = ""
}

variable "checkpoint_password" {
  description = "API password for Checkpoint management"
  type        = string
  sensitive   = true
  default     = ""
}

variable "environment" {
  description = "Deployment environment (dev, prod)"
  type        = string
  default     = "dev"
}