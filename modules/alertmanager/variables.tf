variable "hostname" {
  description = "Hostname"
  type        = string
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1c"
}

variable "instance_type" {
  description = "Instance type for EC2 instance"
  type        = string
  default     = "t2.nano"
}

variable "instance_ami" {
  description = "AMI for EC2 instance"
  type        = string
}

variable "instance_profile" {
  description = "Instance profile for EC2 instance"
  type        = string
}

variable "monitoring_keys" {
  description = "Key name for EC2 instance"
  type        = string
}

variable "config_bucket_name" {
  description = "Name of S3 bucket that stores config files"
  type        = string
}

variable "password" {
  description = "Password for web frontend"
  type        = string
}

variable "letsencrypt_email" {
  description = "Email for Let's Encrypt"
  type        = string
}

variable "security_group_name" {
  description = "Name of security group"
  type        = string
}
