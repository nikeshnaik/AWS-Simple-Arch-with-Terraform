output "vpc" {
  value = module.vpc

}

output "sg" {
  value = module.webserver_security_group

}
