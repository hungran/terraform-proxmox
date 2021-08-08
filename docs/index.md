#Installation Guide
- Terraform version: **Terraform v1.0.3**
- provider.tf:
        terraform {
        required_providers {
            proxmox = {
            source = "telmate/proxmox"
            #version = "latest" // >=v2.7.0
            }
          }
        }
- Then use `terraform init`