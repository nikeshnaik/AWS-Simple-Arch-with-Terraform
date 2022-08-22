variable "namespace" {
  description = "The project namespace to use for unique resources naming"
  type        = string

}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"

}

variable "cidr_block" {

  description = "CIDR Block for private IPs"
  type        = string
}

variable "public_subnets" {
  description = "Public subnet"
  type        = list(string)

}

