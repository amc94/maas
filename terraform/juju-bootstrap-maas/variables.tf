# Copyright 2025 Canonical Ltd.
# See LICENSE file for licensing details.
variable "maas_api_url" {
  type        = string
  description = "MAAS API URL"
}

variable "maas_api_key" {
  type        = string
  description = "MAAS OAuth key for Juju"
  senesitive  = true
}

variable "controller_name" {
  type        = string
  description = "Name of the Juju controller to create"
  default     = "juju-maas"
}

variable "bootstrap_args" {
  type        = string
  description = "Extra args to pass to juju bootstrap (e.g., --model-default)"
  default     = ""
}

variable "constraints" {
  type        = string
  description = "Constraints for the controller"
  default     = ""
}
variable "cloud_name" {
  type        = string
  description = "Name to assign to the Juju cloud when adding MAAS"
  default     = "maas-cloud"
}

variable "credential_name" {
  type        = string
  description = "Name to assign to the Juju credential for MAAS"
  default     = "maas-creds"
}

variable "enable_ha" {
  type        = bool
  description = "Enable HA on Juju Controller"
  default     = "false"
}

variable "number_of_ha_units" {
  type        = number
  description = "number of ha units to bootstrap onto"
  default     = 3
}