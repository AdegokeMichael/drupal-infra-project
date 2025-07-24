# Bastion Host (Public)
resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [var.bastion_sg_id]

  tags = {
    Name = "${var.project}-bastion"
  }
}

# Application Servers (Private)
resource "aws_instance" "app" {
  count         = var.app_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.private_subnet_ids, count.index)
  key_name      = var.key_name
  vpc_security_group_ids = [var.app_sg_id]

  root_block_device {
    volume_size = var.root_volume_size     
    volume_type = var.root_volume_type    
    delete_on_termination = true
  }


  tags = {
    Name = "${var.project}-app-${count.index + 1}"
  }
}
