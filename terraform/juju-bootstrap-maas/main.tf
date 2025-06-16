# Copyright 2025 Canonical Ltd.
# See LICENSE file for licensing details.
resource "local_sensitive_file" "maas_credentials" {
  content = yamlencode({
    credentials = {
      "${var.cloud_name}" = {
        "${var.credential_name}" = {
          "auth-type"  = "oauth1"
          "maas-oauth" = var.maas_api_key
        }
      }
    }
  })

  filename = "${path.module}/tmp/maas_credentials.yaml"
}

resource "local_file" "maas_cloud" {
  content = yamlencode({
    clouds = {
      "${var.cloud_name}" = {
        type       = "maas"
        auth-types = ["oauth1"]
        endpoint   = var.maas_api_url
      }
    }
  })

  filename = "${path.module}/tmp/maas_cloud.yaml"
}

resource "null_resource" "juju_bootstrap_controller" {
  depends_on = [local_sensitive_file.maas_credentials]
  provisioner "local-exec" {
    command     = <<-EOT
      set -euo pipefail

      echo ">> Checking if controller exists: ${var.controller_name}"
      if juju controllers --format json | grep -q '"${var.controller_name}"'; then
        echo ">> Controller '${var.controller_name}' already exists, skipping bootstrap."
        exit 0
      fi

      echo ">> Adding MAAS cloud"
      juju add-cloud --client --file ${local_file.maas_cloud.filename}

      echo ">> Adding MAAS credentials"
      juju add-credential --client --file ${local_sensitive_file.maas_credentials.filename} ${var.cloud_name}


      echo ">> Bootstrapping controller '${var.controller_name}'"
      juju bootstrap --credential maas-creds maas-cloud ${var.controller_name} ${var.bootstrap_args} --constraints ${var.constraints}

      if ${var.enable_ha}; then
        juju enable-ha -n ${var.number_of_ha} --constraints ${var.constraints}
    EOT
    interpreter = ["/bin/bash", "-c"]
  }

  provisioner "local-exec" {
    when        = destroy
    command     = <<-EOT
      set -euo pipefail

      echo ">> Destroying Juju controller '${self.triggers.controller_name}'"
      if juju controllers --format json | grep -q '"${self.triggers.controller_name}"'; then
        juju destroy-controller --yes --destroy-all-models --client ${self.triggers.controller_name}
      else
        echo ">> Controller '${self.triggers.controller_name}' not found, skipping destroy."
      fi
    EOT
    interpreter = ["/bin/bash", "-c"]
  }
  triggers = {
    maas_api_key    = var.maas_api_key
    maas_api_url    = var.maas_api_url
    controller_name = var.controller_name
    bootstrap_args  = var.bootstrap_args
  }
}
