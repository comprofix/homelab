# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "docker" {
    
    # VM General Settings
    target_node = "pve2"
    vmid = "101"
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
        storage = "local-zfs"
    }

    disks {
    scsi {
      scsi0 {
        disk {
          size       = 40
          storage    = "local-zfs"
        }
      }
    }
  }

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    cloudinit_cdrom_storage = "local-zfs"

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


resource "proxmox_vm_qemu" "gitlab" {
    
    # VM General Settings
    target_node = "pve2"
    vmid = "102"
    name = "gitlab"
    desc = "gitlab Server"


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
        storage = "local-zfs"
    }

    disks {
    scsi {
      scsi0 {
        disk {
          size       = 40
          storage    = "local-zfs"
        }
      }
    }
  }

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    cloudinit_cdrom_storage = "local-zfs"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=10.10.10.7/24,gw=10.10.10.1"
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
    target_node = "pve2"
    vmid = "103"
    name = "gitea"
  

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
        storage = "local-zfs"
    }

    disks {
    scsi {
      scsi0 {
        disk {
          size       = 40
          storage    = "local-zfs"
        }
      }
    }
  }

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    cloudinit_cdrom_storage = "local-zfs"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=10.10.10.8/24,gw=10.10.10.1"
    nameserver = "10.10.10.1"
    
    # (Optional) Default User
    ciuser = "${var.ci_user}"
    cipassword = "${var.ci_password}"
    
    # # (Optional) Add your SSH Public KEY
    sshkeys = <<EOF
    ${ var.ssh_key }
    EOF

}


resource "proxmox_lxc" "omada" {
    
    # VM General Settings
    target_node = "pve2"
    vmid = "200"
    hostname = "omada"
    description = "TP-Link Omada Controller"
    ostemplate = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"

    password = "${var.ci_password}"

    memory = 4096
    swap = 512


    # VM Advanced General Settings
    onboot = true
    start = true
    
    timeouts {
        create = "20m"
        delete = "10m"
    }
  
    # VM Memory Settingsport 2019

    unprivileged = true
    features {
      nesting = true
    }

    // Terraform will crash without rootfs defined
    rootfs {
      storage = "local-zfs"
      size    = "8G"
    }

    network {
      name   = "eth0"
      bridge = "vmbr0"
      ip = "10.10.40.2/24"
      gw = "10.10.40.1"
      tag = "40"
    }

    
    # # (Optional) Add your SSH Public KEY
    ssh_public_keys = <<EOF
    ${ var.ssh_key }
    EOF

}

resource "proxmox_vm_qemu" "docker-dev" {
    
    # VM General Settings
    target_node = "pve2"
    vmid = "2000"
    name = "docker-dev"

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
    memory = 8192

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
        tag    = "10"
    }

    efidisk {
        efitype = "4m"
        storage = "local-zfs"
    }

    disks {
    scsi {
      scsi0 {
        disk {
          size       = 40
          storage    = "local-zfs"
        }
      }
    }
  }

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    cloudinit_cdrom_storage = "local-zfs"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=10.10.10.9/24,gw=10.10.10.1"
    nameserver = "10.10.10.1"
    
    # (Optional) Default User
    ciuser = "${var.ci_user}"
    cipassword = "${var.ci_password}"
    
    # # (Optional) Add your SSH Public KEY
    sshkeys = <<EOF
    ${ var.ssh_key }
    EOF

}