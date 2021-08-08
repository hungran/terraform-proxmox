# terraform-proxmox

[![Build Status](https://travis-ci.com/Telmate/terraform-provider-proxmox.svg?branch=master)](https://travis-ci.com/Telmate/terraform-provider-proxmox)

![DONE](docs/done.png)

# Terraform provider plugin for Proxmox

This repository provides both a Terraform provider for the [Proxmox virtualization platform](https://pve.proxmox.com/pve-docs/).

## Getting Started

In order to get started, use [the documentation included in this repository](docs/index.md). The documentation contains
a list of the options for the provider. Moreover, there are some guides available how to combine
options and start specific VMs.

## Quick Start

Follow this [install guide](docs/guides/installation.md) to install the plugin.

## Known Limitations

This section is here to both serve as a reminder to contributers of areas for improvement, but also as a "head's up" to users so you don't have to run into it and then find it buried in some logged issue.

* `proxmox_vm_qemu`.`disk`.`size` attribute does not match what is displayed in the Proxmox UI.
* Updates to `proxmox_vm_qemu` resources almost always result as a failed task within the Proxmox UI. This appears to be harmless and the desired configuration changes do get applied.
* `proxmox_vm_qemu` does not (yet) validate vm names, be sure to only use alphanumeric and dashes otherwise you may get an opaque 400 Parameter Verification failed (indicating a bad value was sent to proxmox).
* When using the `proxmox_lxc` resource, the provider will crash unless `rootfs` is defined.

## Contributing

When contributing, please also add documentation to help other users.

### Debugging the provider

Debugging is available for this provider through the Terraform Plugin SDK versions 2.0.0. Therefore the plugin can be 
started with the debugging flag `--debug`.

For example (using [delve](https://github.com/go-delve/delve) as Debugger):
```bash
dlv exec --headless ./terraform-provider-my-provider -- --debug
```

For more information about debugging a provider please see: [Debugger-Based Debugging](https://www.terraform.io/docs/extend/debugging.html#debugger-based-debugging)

## Useful links

* [Proxmox](https://www.proxmox.com/en/)
* [Proxmox documentation](https://pve.proxmox.com/pve-docs/)
* [Terraform](https://www.terraform.io/)
* [Terraform documentation](https://www.terraform.io/docs/index.html)
* [Recommended ISO builder](https://github.com/Telmate/terraform-ubuntu-proxmox-iso)

