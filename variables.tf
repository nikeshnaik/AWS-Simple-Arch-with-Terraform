variable "namespace" {
  description = "The project namespace to use for unique resources naming"
  type        = string

}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"

}
