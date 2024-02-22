provider "aws" {
  region = "us-east-1" 
}

resource "aws_instance" "SERVER1" {
  ami           = "ami-0e731c8a588258d0d"   
  instance_type = "t2.micro" 
  key_name = "FINAL KEYPAIR"
  monitoring = true

  tags = {
    Name = "SERVER1"
  }
}
