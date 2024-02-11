resource "aws_instance" "Demo-instance" {
  ami = "ami-05a5bb48beb785bf1"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  key_name = "key1-ec2"
  security_groups = [aws_security_group.sg_1.name]

  tags = {
    Name = "HelloWorld"
  }
}
resource "aws_ebs_volume" "ebs1" {
  availability_zone = "ap-south-1a"
  size= 1
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs1.id
  instance_id = aws_instance.Demo-instance.id
}
resource "aws_key_pair" "key1" {
  key_name   = "key1-ec2"
  public_key = "ssh-rsa"
  
}
