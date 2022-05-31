# terraform-upcloud-faasd

This repo contains a Terraform plan for deploying a [faasd](https://github.com/openfaas/faasd) instance on
[Upcloud](https://upcloud.com/) using [Terraform](https://www.terraform.io/).

__faasd__, a lightweight & portable faas engine, is [OpenFaaS](https://github.com/openfaas/) reimagined, but without the cost and complexity of Kubernetes. It runs on a single host with very modest requirements, making it fast and easy to manage. Under the hood it uses [containerd](https://containerd.io/) and [Container Networking Interface (CNI)](https://github.com/containernetworking/cni) along with the same core OpenFaaS components from the main project.

## Requirements

| Name | Version |
| ---- | ------- |
| [terraform](https://www.terraform.io/downloads) | >=1.0.0 |
| [Upcloud](https://upcloud.com/) | >=2.0 |
| [random](https://registry.terraform.io/providers/hashicorp/random/latest/docs) | >=3.1.2 |
| [Task](https://taskfile.dev/) | >=3.12.1 |

## Providers

|Name | Version |
| --- | ------- |
| Upcloud | >=2.0 |
| random | >=3.1.2 |

## Terraform Resources

| Name | Type |
| ---------| ------------|
| [upcloud_server](https://registry.terraform.io/providers/UpCloudLtd/upcloud/latest/docs/resources/server) | Resource |
| [upcloud_firewall_rules](https://registry.terraform.io/providers/UpCloudLtd/upcloud/latest/docs/resources/firewall_rules) | Resource | 
| [random_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | Resource |

## Terraform Variables
 Edit the `terraform.tfvars` file to add the variables as per your need.

| Name | Description | Type | Required|
| ---- | ----------- | ---- | ------- |
| `username` | User name to create the resource | string | yes |
| `password` | Paassword for the user to authenticate | string | yes
| `hostname` | Hostname for upcloud instance  | string | yes |
| `zone` | Upcloud server zone | string | yes |
| `plan` | Plan for the instance |  string | yes |
| `instance_username` | Username for instance to login |  string | yes |
| `ssh_public_key_path` | SSH key path for authentication | string | yes |
| `domain` | Set the domain name for instance | string | no |
| `email` | Set the email | string | no |
| `basic_auth_user` | The basic auth user name | string | no |
| `basic_auth_password` | The basic auth password, if left empty, a random password is generated | string | no |

# Usage
Here we have handle this terraform plan using the [Task](https://taskfile.dev/) . It is a task runner / build tool that aims to be simpler and easier to use.

## Configure terraform variables

You may run below command to template out a `terraform.tfvars` file.

```
task setup
```

## Deploy faasd instance

Once your variables are in place we are ready to perform terraform plan using below command.

```
task apply
```
## Login to the faasd instance

Run below command to access your instance via SSH.

```
task login
```

## Destroy faasd server

If you need to destroy created resource use following command `task destroy`

## Output

| Name | Description |
| ---- | ----------- |
| gateway_url | The url of the faasd gateway. |
| user_name | The basic auth user name. |
| password | Path of basic auth password. |
| faasd_server_username | The username for faasd instance |
| faasd_server_ip | The public IP address of the faasd instance. |


## See Also

- [faasd on Amazon Web Services with Terraform](https://github.com/jsiebens/terraform-aws-faasd)
- [faasd on Google Cloud Platform with Terraform](https://github.com/jsiebens/terraform-google-faasd)
- [faasd on Microsoft Azure with Terraform](https://github.com/jsiebens/terraform-azurerm-faasd)
- [faasd on DigitalOcean with Terraform](https://github.com/jsiebens/terraform-digitalocean-faasd)
- [faasd on Equinix Metal with Terraform](https://github.com/jsiebens/terraform-equinix-faasd)
- [faasd on Scaleway with Terraform](https://github.com/jsiebens/terraform-scaleway-faasd)
- [faasd on Exoscale with Terraform](https://github.com/itTrident/terraform-exoscale-faasd)
- [faasd on Linode with Terraform](https://github.com/itTrident/terraform-linode-faasd)
- [faasd on Vultr with Terraform](https://github.com/itTrident/terraform-vultr-faasd)