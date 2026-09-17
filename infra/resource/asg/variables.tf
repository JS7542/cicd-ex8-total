variable "tag_header" {
  description = "tag header supplied by root module"
  type        = string
}

variable "vpc_id" {
  description = "vpc id supplied by root module"
  type        = string
}

variable "internal_ssh_sg_id" {
  description = "internal ssh sg id supplied by root module"
  type        = string
}

variable "external_alb_sg_id" {
  description = "external alb sg id supplied by root module"
  type        = string
}

variable "web_sg_id" {
  description = "web sg id supplied by root module"
  type        = string
}

variable "public_subnet_ids" {
  description = "public subnet ids supplied by root module"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "private subnet ids supplied by root module"
  type        = list(string)
}

variable "ami_id" {
  description = "ami id supplied by root module"
  type        = string
}

variable "user_data" {
  description = "user data supplied by root module"
  type        = string
}

variable "key_name" {
  description = "key name supplied by root module"
  type        = string
}

variable "instance_type" {
  description = "Web ASG 인스턴스 타입 (루트 입력)"
  type        = string
}

variable "scaling" {
  description = "노드/인스턴스 수 (루트 입력)"
  type        = object({ min_size = number, desired_size = number, max_size = number })
}

