# neeythann/dev-env

`dev-env` is my personal Infrastructure-as-Code (IaC) setup to spin up an  
ephemeral development environment on [Hetzner Cloud](https://www.hetzner.com/cloud).

Designed for fast prototyping and throwaway environments, it provisions a  
ready-to-code remote workspace with my preferred development tools  
(e.g., Neovim) and configuration on Debian 13 using Terraform and  
Cloud-init.

## Requirements

- Terraform v1.13.1 or later
- Hetzner Cloud API key with r/w permissions

## Installation

1. Install the required dependencies mentioned above
2. git clone and `cd` into the repository:  
`git clone https://github.com/neeythann/dev-env.git && cd dev-env`
3. (optional) export `HCLOUD_TOKEN` in your environment variables
4. `terraform init`
5. `terraform apply`

After `terraform apply` completes, it will output a `server_ip` variable.  
Note that provisioning can take up to 5 minutes due to cold starts and  
dependency installations.

Once ready, you can SSH into the server using: `ssh nathan@<server_ip>`

## Configuration

You can change the username by modifying the `users[0].name`, and update the  
SSH public keys in `users[0].ssh_import_id` in the `cloud-init.yaml` file.  
Furthermore, the server configuration is defined on the `terraform.tfvars`  
file, which you could modify according to the Hetzner API server specification  
at <https://docs.hetzner.cloud/reference/cloud#servers>

## Contributions

Contributions are welcome! Feel free to submit a PR for improvements and bug fixes
