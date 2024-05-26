# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "docker" {
    
    # VM General Settings
    target_node = "pve1"
    vmid = "105"
    name = "docker"
    desc = "Docker Server"


    # VM Advanced General Settings
    onboot = true
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
    machine = "q35"
    qemu_os = "l26"
    
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
        storage = "proxmox"
    }

    disks {
    scsi {
      scsi0 {
        disk {
          size       = 40
          storage    = "proxmox"
        }
      }
    }
  }

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    cloudinit_cdrom_storage = "proxmox"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=10.10.10.5/24,gw=10.10.10.1"
    nameserver = "10.10.10.1"
    
    # (Optional) Default User
    ciuser = "${var.ci_user}"
    cipassword = "${var.ci_password}"
    
    # # (Optional) Add your SSH Public KEY
    sshkeys = <<EOF
    ${ var.ssh_key }
    EOF

}


resource "proxmox_vm_qemu" "gitea" {
    
    # VM General Settings
    target_node = "pve1"
    vmid = "100"
    name = "gitea"
    desc = "Gitea Server"


    # VM Advanced General Settings
    onboot = true
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
    machine = "q35"
    qemu_os = "l26"
    
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
        storage = "proxmox"
    }

    disks {
    scsi {
      scsi0 {
        disk {
          size       = 80
          storage    = "proxmox"
        }
      }
    }
  }

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    cloudinit_cdrom_storage = "proxmox"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=10.10.10.2/24,gw=10.10.10.1"
    nameserver = "10.10.10.1"
    
    # (Optional) Default User
    ciuser = "${var.ci_user}"
    cipassword = "${var.ci_password}"
    
    # # (Optional) Add your SSH Public KEY
    sshkeys = <<EOF
    ${ var.ssh_key }
    EOF

}