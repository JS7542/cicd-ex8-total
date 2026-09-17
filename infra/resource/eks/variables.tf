variable "tag_header" {
  description = "tag header supplied by root module"
  type        = string
}

variable "eks_cluster_sg_id" {
  description = "eks cluster sg id supplied by root module"
  type        = string
}

variable "eks_node_sg_id" {
  description = "eks node sg id supplied by root module"
  type        = string
}

variable "cluster_subnet_ids" {
  description = "cluster subnet ids supplied by root module"
  type        = list(string)
}

variable "key_name" {
  description = "key name supplied by root module"
  type        = string
}

variable "eks_version" {
  description = "eks version supplied by root module"
  type        = string
}

variable "node_policies" {
  description = "EKS Worker Role에 연결할 IAM 정책 ARN (루트 입력)"
  type        = list(string)
}

variable "instance_types" {
  description = "EKS Node Group 인스턴스 타입 (루트 입력)"
  type        = list(string)
}

variable "scaling" {
  description = "노드/인스턴스 수 (루트 입력)"
  type        = object({ min_size = number, desired_size = number, max_size = number })
}

