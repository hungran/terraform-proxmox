###################################
###### Global Configuration #######
###################################
variable "pm_api_url" {
  default = "https://192.168.10.4:8006/api2/json"
}

variable "pm_user" {
    default = "root@pam"
}

variable "pm_password" {
    default = "Password123"
}

variable "ssh_key" {
    type = string
}

variable "cpu" {
    default = "kvm64" // "host"
    description = "Other requirement check docs"
}

variable "pm-template-name" {
    type = string
    description = "template from promox"
    default = "ubuntu-1804-cloudinit-template"
}


#########################
###### k3s_server #######
#########################

variable "k3s_server_count" {
    type        = number
    default     = 1
    description = "Number of k3s Master Node"
}

variable "k3s_server_cores" {
    type        = number
    default     = 4
}

variable "k3s_server_sockets" {
    type        = number
    default     = 1
}

variable "k3s_server_memory" {
    type        = number
    default     = 2048
}

variable "k3s_server_disk_size" {
    type        = string
    default     = "20G"
    description = "Size of root disk GiB" 
}

# variable "k3s_server_ipconfig0" {
#     type        = string
#     description = " The specified configuration is added to /etc/network/interfaces for Ubuntu, or /etc/sysconfig/network-scripts/ifcfg-eth0 for CentOS. Forces re-creation on change."
# }

#########################
###### k3s_agent #######
#########################

variable "k3s_agent_count" {
    type        = number
    default     = 1
    description = "Number of k3s Master Node"
}

variable "k3s_agent_cores" {
    type        = number
    default     = 1
}

variable "k3s_agent_sockets" {
    type        = number
    default     = 4
}
variable "k3s_agent_memory" {
    type        = number
    default     = 2048
}

variable "k3s_agent_disk_size" {
    type        = string
    default     = "20G"
    description = "Size of root disk GiB" 
}

# variable "k3s_agent_ipconfig0" {
#     type        = string
#     description = " The specified configuration is added to /etc/network/interfaces for Ubuntu, or /etc/sysconfig/network-scripts/ifcfg-eth0 for CentOS. Forces re-creation on change."
# }

#########################
######  storage   #######
#########################

variable "storage_count" {
    type        = number
    default     = 1
    description = "Number of k3s Master Node"
}

variable "storage_cores" {
    type        = number
    default     = 1
}

variable "storage_sockets" {
    type        = number
    default     = 4
}

variable "storage_memory" {
    type        = number
    default     = 2048
}

variable "storage_disk_size" {
    type        = string
    default     = "20G"
    description = "Size of root disk GiB" 
}

# variable "storage_ipconfig0" {
#     type        = string
#     description = " The specified configuration is added to /etc/network/interfaces for Ubuntu, or /etc/sysconfig/network-scripts/ifcfg-eth0 for CentOS. Forces re-creation on change."
# }