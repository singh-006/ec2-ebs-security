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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCoeZzcaDKHj3lg05hAFCbWXi0BskDR0Qa+EE97KI59qQmrxExBFzA/ICdtctjPLxDIoZh6goo3rvAD9LZm38eiXBDk+7NuzQXdsz5998i8R71ezTNtgqPsjXYUqyHpBwh/mwAcHj5F6xCwMFsVbdpQBxl5WeT/YqWSSpVbnSU27eCpHKcHqKBn1J/6mVvztfF8aKjGkD0Qw9bbu5GQYDjGC0DaK+rYXLN41IHobZm8btPESYzV7hlIXca6WBTviZr+9ht/0XhPyCBtB57Iv6rTH7zdS3VHswo1wrE0qYe/lcQy96z2qSNChY7/Ew55iX1VevjDdjtlPacyx1q2hN8+ouzszjIIxxDjrgkZCsCZlSluA80ZGwF4bTZF8BCdNVRS5EnKKWZOXl9PP8uH/XvRK2UsP6grjfKOfpPZu1/LO1p0juwwK6oQD++SxoFMz4/ao4fx1aYS8mQknoYl+5a7MIaZX0+rLnD3RGs+UvObgIASRKMWXFXa/SDipv+TLcs= monali@DESKTOP-IL43T14"
  
}