variable "tag_header" {
  description = "tag header supplied by root module"
  type        = string
}

variable "vpc_id" {
  description = "vpc id supplied by root module"
  type        = string
}

variable "vpc_cidr" {
  description = "vpc cidr supplied by root module"
  type        = string
}

variable "database_sg" {
  description = "DB 종류별 보안그룹 이름과 포트 (루트 입력)"
  type        = map(object({ name = string, port = number }))
}

