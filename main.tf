terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      #version = "latest"
    }
  }
}
provider "proxmox" {
  pm_parallel       = 1
  pm_tls_insecure   = true
  pm_api_url        = var.pm_api_url
  pm_password       = var.pm_password
  pm_user           = var.pm_user
}

resource "proxmox_vm_qemu" "k3s_server" {
  count             = var.k3s_server_count
  name              = "kubernetes-master-${count.index}"
  target_node       = "pve"

  clone             = var.pm-template-name

  os_type           = "cloud-init"
  cores             = var.k3s_server_cores
  sockets           = var.k3s_server_sockets
  cpu               = var.cpu
  memory            = var.k3s_server_memory
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"

  disk {
    size            = var.k3s_server_disk_size
    type            = "scsi" //type            = "virtio" //
    storage         = "lvm-storage"
    #storage_type    = "lvm"
    iothread        = 1
  }

  network {
    model           = "virtio"
    bridge          = "vmbr0"
  }

  lifecycle {
    ignore_changes  = [
      network,
    ]
  }

  # Cloud Init Settings
  ipconfig0         = "ip=192.168.10.10${count.index + 1}/24,gw=192.168.10.1"

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}

resource "proxmox_vm_qemu" "k3s_agent" {
  count             = var.k3s_agent_count
  name              = "kubernetes-node-${count.index}"
  target_node       = "pve"

  clone             = var.pm-template-name

  os_type           = "cloud-init"
  cores             = var.k3s_agent_cores
  sockets           = var.k3s_agent_sockets
  cpu               = var.cpu
  memory            = var.k3s_agent_memory
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"

  disk {
    size            = var.k3s_agent_disk_size
    type            = "scsi" //type            = "virtio" //type            = "scsi"
    storage         = "lvm-storage"
    #storage_type    = "lvm"
    iothread        = 1
  }

  network {
    model           = "virtio"
    bridge          = "vmbr0"
  }

  lifecycle {
    ignore_changes  = [
      network,
    ]
  }

  # Cloud Init Settings
  ipconfig0         = "ip=192.168.10.11${count.index + 1}/24,gw=192.168.10.1"

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}

resource "proxmox_vm_qemu" "storage" {
  count             = var.storage_count
  name              = "storage-node-${count.index}"
  target_node       = "pve"

  clone             = var.pm-template-name

  os_type           = "cloud-init"
  cores             = var.storage_cores
  sockets           = var.storage_sockets
  cpu               = var.cpu
  memory            = var.storage_memory
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"

  disk {
    size            = var.storage_disk_size
    type            = "scsi" //type            = "virtio" //type            = "scsi"
    storage         = "lvm-storage"
    #storage_type    = "lvm"
    iothread        = 1
  }

  network {
    model           = "virtio"
    bridge          = "vmbr0"
  }

  lifecycle {
    ignore_changes  = [
      network,
    ]
  }

  # Cloud Init Settings
  ipconfig0         = "ip=192.168.10.12${count.index + 1}/24,gw=192.168.10.1"

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}