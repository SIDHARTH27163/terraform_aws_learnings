variable "region" {
  description = "value of region"
  type = string
  default = "eu-north-1"

}

variable "ami" {
    default = "ami-016038ae9cc8d9f51"
    type = string
    description = "value for ami"  
}

variable "instance_type" {
  default = "t3.micro"
  type = string
  description = "value for instance type"
}
variable "tags" {
    default = "SampleServer"
    type = string
    description = "value for server name or tag name"
  
}