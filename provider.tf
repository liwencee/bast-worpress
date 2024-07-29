

resource "aws_instance" "terraform-instances" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"

  tags = {
    Name        = "terraform-pair"
    Environment = "Dev"
  }
}


