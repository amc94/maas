## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.maas_cloud](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_sensitive_file.maas_credentials](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [null_resource.juju_bootstrap_controller](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bootstrap_args"></a> [bootstrap\_args](#input\_bootstrap\_args) | Extra args to pass to juju bootstrap (e.g., --model-default) | `string` | `""` | no |
| <a name="input_cloud_name"></a> [cloud\_name](#input\_cloud\_name) | Name to assign to the Juju cloud when adding MAAS | `string` | `"maas-cloud"` | no |
| <a name="input_constraints"></a> [constraints](#input\_constraints) | Constraints for the controller | `string` | `""` | no |
| <a name="input_controller_name"></a> [controller\_name](#input\_controller\_name) | Name of the Juju controller to create | `string` | `"juju-maas"` | no |
| <a name="input_credential_name"></a> [credential\_name](#input\_credential\_name) | Name to assign to the Juju credential for MAAS | `string` | `"maas-creds"` | no |
| <a name="input_enable_ha"></a> [enable\_ha](#input\_enable\_ha) | Enable HA on Juju Controller | `bool` | `"false"` | no |
| <a name="input_maas_api_key"></a> [maas\_api\_key](#input\_maas\_api\_key) | MAAS OAuth key for Juju | `string` | n/a | yes |
| <a name="input_maas_api_url"></a> [maas\_api\_url](#input\_maas\_api\_url) | MAAS API URL | `string` | n/a | yes |
| <a name="input_number_of_ha_units"></a> [number\_of\_ha\_units](#input\_number\_of\_ha\_units) | number of ha units to bootstrap onto | `number` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_juju_controller"></a> [juju\_controller](#output\_juju\_controller) | Copyright 2025 Canonical Ltd. See LICENSE file for licensing details. |
