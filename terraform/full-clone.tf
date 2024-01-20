# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "debian" {
    
    # VM General Settings
    target_node = "pve1"
    vmid = "200${count.index + 1}"
    name = "Server-0${count.index + 1}"
    count = 3
    desc = "Debian 12 generic"

    # VM Advanced General Settings
    onboot = true 

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
    cores = 4
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = 4096

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
        tag    = "100"
    }

   # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=10.10.100.9${count.index + 1}/24,gw=10.10.100.1"
    nameserver = "10.10.100.1"
    
    # (Optional) Default User
    ciuser = "administrator"
    
    # (Optional) Add your SSH Public KEY
    sshkeys = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDfuR45VZdCGKRfr9qaqOSSjrFu7ggOpgIU3DEc3zdAyt+sVnFjY1mBu2llJgZnJcgQ7hTCwI42zbWf16P+Muqm/4s4dk0FKKJ24UH9f1pWUFvGCmm/fTINinCx34bwGlKG7kuPDEExKjskaUY/o75sQA87FxSXrCdEDVdF0addY19hW+F0/X9j4odwETJvLrLVxvx8KpzdSQuwB4apcY/dwcPCOxaNF0nfTbg+OWc/waTVhlB7HDiB/K8KGv16eL/4TpEtkt7S26p4rUf4cz0cRmt5XWkVfXThs/jBSfYMr/QXddSS+o/Y0hMdju4yuQfOU26i8XT2xxT9hUPjGXAgbPgzP5mksIoj11DhJYyRaTeB5EaI6XOFImgUzk00nOeLuBsoPFtfEQXVyZnla6U06DFQcVdtV9aszYC7mtUNJX8lB/w3IxkaHY/l/pJExuON2hq/5rI5LI6gVxJosSs9d6YT04lRGOAUmQKV8BufhbTItNO2tQaDvGed4sH7wkU= administrator@localhost
    EOF
}