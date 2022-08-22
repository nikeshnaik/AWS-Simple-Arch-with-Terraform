module "networking" {
  source         = "./networking/"
  namespace      = var.namespace
  cidr_block     = var.cidr_block
  public_subnets = var.public_subnets
  region         = var.region

}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}


resource "aws_instance" "webserver" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    "Name" = "${var.namespace}-instance"
  }


}


resource "aws_network_interface" "eni_ec2" {

  subnet_id       = module.networking.vpc.public_subnets.id
  security_groups = [module.networking.vpc.webserver_security_group]

}
