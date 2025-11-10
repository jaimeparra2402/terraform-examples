# Crear nodo tf_vm
resource "openstack_compute_instance_v2" "tf_vm" {
  name              = "tf_vm"
  image_name        = "jammy"
  availability_zone = "nova"
  flavor_name       = "medium"
  key_pair          = var.openstack_keypair
  security_groups   = ["default"]
  network {
    name = var.openstack_network_name 
  }
}

# Crear una Floating IP
resource "openstack_networking_floatingip_v2" "tf_vm_ip" { 
  pool = "ext-net"
}

# Obtener el puerto de red asociado a la instancia
data "openstack_networking_port_v2" "vm_port" {
  device_id = openstack_compute_instance_v2.tf_vm.id
}

# Asociar la Floating IP al puerto de la instancia
resource "openstack_networking_floatingip_associate_v2" "tf_vm_ip" {
  floating_ip = openstack_networking_floatingip_v2.tf_vm_ip.address
  port_id     = data.openstack_networking_port_v2.vm_port.id
}

# Mostrar la Floating IP creada
output "tf_vm_Floating_IP" {
  value      = openstack_networking_floatingip_v2.tf_vm_ip.address 
  depends_on = [openstack_networking_floatingip_v2.tf_vm_ip] 
}


