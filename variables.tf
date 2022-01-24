variable "environment" {
  description = "environment of current stage"
  type        = string
  default     = "dev"
}

variable "aws_profile" {
  description = "aws credentials profile"
  type        = string
  default     = "default"
}

variable "name" {
  description = "Name to be used on EC2 instance created"
  type        = string
  default     = "automationhero.devops"
}

variable "region" {
  description = "Region of EC2 instance"
  type        = string
  default     = "eu-west-1"
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-0f29c8402f8cce65c"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}