resource "azurerm_network_interface" "vm_nic" {
  count               = 2
  name                = "nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  count                 = 2
  name                  = "app-${count.index}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = "Standard_B2ms"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.vm_nic[count.index].id]
  # admin_password                  = "P@ssw0rd1234!"

  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSWvYa2kOiC4tkMvXE8TI5WBXhsPXg/YcVtkQJMUDH2AyFpGBMZ/LHKLUbHENmQd/q1bARJZJNmj+xmWvyeBFyQjUR21ybAAJBeAXzamh/a9GciWwePcIv1ZHMr6gs8FOa6XoJmiomeVRseZBNViA9xx2gEqh9Df99ftC6yWPCpI2KquOOnGKXzCrYtq1Iu7du0E04S5XcOFMmx8O5zHYgSjvrg+/UytCuhW0pNTFZdSdkTiKOKHySBItEGeOEUA7jEwnF1pjFPrJT0kCHPyW1h2iI2BnLPyMyntDIJltoj8vbpTCJeaXgasBr/Ghdzkf4pLAczaZfNuETsKf75DiT"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
