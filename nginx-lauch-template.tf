resource "aws_launch_template" "nginx-launch-template" {
  name_prefix   = "nginx-"
  image_id      = "ami-04a81a99f5ec58529"  # Replace with your AMI ID
  instance_type = "t2.micro"      # Replace with your instance type

  user_data = filebase64("${path.module}/bin/bastion.sh")

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = "subnet-0116458c8fe8d8b78"  # Replace with your subnet ID
    security_groups             = ["sg-0e3a17a33a368905c"]    # Replace with your security group ID(s)
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "nginx-instance"
    }
  }

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size           = 20   # Modify as needed
      delete_on_termination = true
      volume_type           = "gp2"
    }
  }
}
