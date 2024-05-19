# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "gitlab" {
    
    # VM General Settings
    target_node = "pve1"
    vmid = "600"
    name = "Gitlabtf"
    desc = "Gitlab Server"


    # VM Advanced General Settings
    onboot = true
    bootdisk = "scsi0"
    scsihw       = "virtio-scsi-single"

    # VM OS Settings
    clone = "debian-12-generic-amd64"
    clone_wait        = 45
    timeouts {
        create = "20m"
        delete = "10m"
    }

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 1
    sockets = 4
    cpu = "kvm64"
    bios = "ovmf"

    
    # VM Memory Settings
    memory = 16384

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
        tag    = "10"
    }

    efidisk {
        efitype = "4m"
        storage = "storage0"
    }

    disks {
    scsi {
      scsi0 {
        disk {
          size       = 80
          storage    = "storage0"
        }
      }
    }
  }

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    cloudinit_cdrom_storage = "storage0"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=10.10.10.99/24,gw=10.10.10.1"
    nameserver = "10.10.10.1"
    
    # (Optional) Default User
    ciuser = "${var.ci_user}"
    cipassword = "${var.ci_password}"
    
    # # (Optional) Add your SSH Public KEY
    sshkeys = <<EOF
    ${ var.ssh_key }
    EOF

}

resource "proxmox_vm_qemu" "docker" {
    
    # VM General Settings
    target_node = "pve1"
    vmid = "601"
    name = "Dockertf"
    desc = "Docker Server"


    # VM Advanced General Settings
    onboot = true
    bootdisk = "scsi0"
    scsihw       = "virtio-scsi-single"

    # VM OS Settings
    clone = "debian-12-generic-amd64"
    clone_wait        = 45
    timeouts {
        create = "20m"
        delete = "10m"
    }

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 1
    sockets = 4
    cpu = "kvm64"
    bios = "ovmf"

    
    # VM Memory Settings
    memory = 16384

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
        tag    = "10"
    }

    efidisk {
        efitype = "4m"
        storage = "storage0"
    }

    disks {
    scsi {
      scsi0 {
        disk {
          size       = 40
          storage    = "storage0"
        }
      }
    }
  }

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    cloudinit_cdrom_storage = "storage0"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=10.10.10.100/24,gw=10.10.10.1"
    nameserver = "10.10.10.1"
    
    # (Optional) Default User
    ciuser = "${var.ci_user}"
    cipassword = "${var.ci_password}"
    
    # # (Optional) Add your SSH Public KEY
    sshkeys = <<EOF
    ${ var.ssh_key }
    EOF

}