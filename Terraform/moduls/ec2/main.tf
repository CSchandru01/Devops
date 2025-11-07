
resource "aws_instance" "demo_instance" {
  # Use the AMI ID from the variable defined in variables.tf
  ami= var.demo_instance_ami

  count = var.instace_count

  # defoult instance type from variables.tf
  instance_type = var.demo_instance_type 

  key_name = var.key_name

  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  subnet_id              = aws_subnet.demo_subnet.id

  tags = {
    Name = "${var.clustername}-DemoInstance-${count.index + 1}"
  } 
}