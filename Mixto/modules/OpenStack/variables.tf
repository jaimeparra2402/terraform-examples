variable "openstack_user_name" {
    description = "The username for the Tenant."
    default  = "jpj451-MII"
}

variable "PASSWORD" {
    description = "The user password."
    type = string
    sensitive = true
}

variable "openstack_tenant_name" {
    description = "The name of the Tenant."
    default  = "jpj451-jpj"
}

variable "openstack_auth_url" {
    description = "The endpoint url to connect to OpenStack."
        default  = "https://192.168.64.50:5000/v3"
}

variable "openstack_keypair" {
    description = "The keypair to be used."
    default  = "jpj451-ual"
}

variable "openstack_network_name" {
  description = "Nombre de la red a usar en OpenStack"
  default     = "jpj451-net"
}


