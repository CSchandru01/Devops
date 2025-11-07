output "demo_instance_ip" {
    description = "The public IP address of the demo EC2 instance"
    value       = aws_instance.demo_instance.*.public_ip
  
}