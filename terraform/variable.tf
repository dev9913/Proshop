variable "env" {
  description = "Enviroment variable"
  type        = string
  default     = "prod"
}
variable "account_id" {
  description = "AWS account ID allowed to access the S3 bucket"
  type        = string
  default     = ""  # or put your actual account ID like "123456789012"
}
variable "region" {
  description = "EC2 region "
  type        = string
  default     = "us-east-1"
}
variable "s3bucket" {
  description = "s3 bucket name"
  type        = string
  default     = ""
}    
variable "ami" {
  description = "Enter ami id like ubuntu, redhat "
  type        =  string
  default    = ""
}

variable "ssh_user" {
  description = "Enter user like ubuntu,  "
  type    = string
  default = "ubuntu"
}

variable "instance" {
  description = "EC2 instance type AmazonLinux → ec2-user,RHEL → ec2-user,Ubuntu → ubuntu"
  type        = string
  default     = "t2.medium"
}
variable "volume_size" {
  description = "EC2 volume size like 8 0r 20 gb.  "
  type        = number
  default     = 16
}
variable "volume_type" {
  description = "EC2 volume type"
  type        =  string
  default     = "gp3"
}