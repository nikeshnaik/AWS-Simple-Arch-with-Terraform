module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "2.64.0"
  name    = "${var.namespace}-vpc"

  cidr = var.cidr_block # will give 8 ip addresss with 5 reserved by AWS for DNS, routing etc

  azs = [var.region]

  public_subnets = var.public_subnets # Again 8 IPS.

}


module "webserver_security_group" {

  source = "terraform-aws-modules/security-group/aws"
  vpc_id = module.vpc.vpd_id
  ingress_rules = [{
    port        = 80
    cidr_blocks = ["0.0.0.0/0"] ## Accept any IP on port 80 
    },
    {
      port        = 443
      cidr_blocks = ["0.0.0.0/0"]
  }]

}

resource "aws_internet_gateway_attachment" "internet_gateway" {

  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = "${var.namespace}-ig"

}


# Routes Internet packets to Internet Gateway
resource "aws_route_table" "route_table" {
  vpc_id = module.vpc.vpc_id


  route = [{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway_attachment.internet_gateway.internet_gateway_id
    }
  ]
}


# Routes Packets from IG to security group with inbound rule. Thus making subnet, a public subnet
resource "aws_route_table_association" "rt_public_subnet_ig" {
  subnet_id  = module.vpc.public_subnets[0]
  gateway_id = aws_internet_gateway_attachment.internet_gateway.internet_gateway_id
}



