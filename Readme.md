![AWS Simple Arch](AWS_Simple_Arch.jpeg)



### AWS Simple Architecture build with Terraform


1. We will be using most common AWS architecture design given by [AWS Docs](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Scenario1.html), the docs are easy to understand but this project will try to implement it with Terraform. 

2. We will be using best practises of Terraform for IaC. 

3. The AWS Docs should be fair enough to start, but we will following some kind of process by breaking down all components into tasks and complete it in Agile or Iterations.

4. We will be writing user stories kind of for AWS Architecture. Something experimental, as more people discuss on architecture better it will get. 

5. Low key Goal of project is to Use Terraform and apply Software Development Process to provision infrastructure.


## Resources used to learn few concepts

### VPC & Subnets CIDR
1. [CIDR base](https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking)

2. [AWS CIDR example](https://medium.com/geekculture/aws-vpc-and-subnet-cidr-calculation-and-allocation-cfbe69050712)

3. [CIDR playground](https://www.ipaddressguide.com/cidr)

4. [Terraform module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)




### Routing

1. VPC with CIDR block `10.0.0.0/16` --> 65536 private IPv4 addresses
2. Subnet mask over it will give `10.0.0.0/24` -->   256 private IPv4 addresses for public or private depends. If IP address are routed to internet gateat then its publick subnet else if they are internally routed within VPC, they are private subnet IPs.
3. EC2 Instance with Elastic IP address `198.51.124.2` is a public address connected to internet
4. Custom Route Table 
    1. `10.0.0.0/16` to default internal routing within VPC
    2. `0.0.0.0/0` to Internet Gateway, routes to IG.
5. Security Group will have inbound rule for `0.0.0.0/0` on port `80` which comes from internet gateway.