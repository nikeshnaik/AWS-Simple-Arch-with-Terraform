variable "namespace" {
  description = "namespace for unique id"
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

