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
