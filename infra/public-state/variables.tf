# =============================================================================
# Variables
# =============================================================================

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-east-1"
}

variable "default_name" {
  description = "Resource name prefix"
  type        = string
  default     = "std20"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Public / Private / Cluster subnet CIDRs"
  type        = list(map(string))

  default = [
    {
      "ap-east-1a" = "10.0.1.0/24"
      "ap-east-1b" = "10.0.2.0/24"
      "ap-east-1c" = "10.0.3.0/24"
    },
    {
      "ap-east-1a" = "10.0.11.0/24"
      "ap-east-1b" = "10.0.12.0/24"
      "ap-east-1c" = "10.0.13.0/24"
    },
    {
      "ap-east-1a" = "10.0.21.0/24"
      "ap-east-1b" = "10.0.22.0/24"
      "ap-east-1c" = "10.0.23.0/24"
    }
  ]
}

variable "ssh_public_key_path" {
  description = "WSL SSH public key path"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "eks_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.35"
}

variable "db_name" {
  description = "MySQL database name"
  type        = string
  default     = "testdb"
}

variable "db_username" {
  description = "MySQL master username"
  type        = string
  default     = "std20"
}
variable "database_sg" {
  description = "DB 종류별 보안그룹 이름과 포트"
  type        = map(object({ name = string, port = number }))
  default     = {
    mysql = {
      name = "internal-mysql-sg"
      port = 3306
    }

    mariadb = {
      name = "internal-mariadb-sg"
      port = 3306
    }

    postgresql = {
      name = "internal-postgresql-sg"
      port = 5432
    }

    oracle = {
      name = "internal-oracle-sg"
      port = 1521
    }

    mssql = {
      name = "internal-mssql-sg"
      port = 1433
    }

    redis = {
      name = "internal-redis-sg"
      port = 6379
    }
  }
}

variable "node_policies" {
  description = "EKS Worker Role에 연결할 IAM 정책 ARN"
  type        = list(string)
  default     = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  ]
}

variable "compute_instance_type" {
  description = "단독 EC2 인스턴스 타입"
  type        = string
  default     = "t3.nano"
}

variable "asg_instance_type" {
  description = "Web ASG 인스턴스 타입"
  type        = string
  default     = "t3.nano"
}

variable "eks_instance_types" {
  description = "EKS Node Group 인스턴스 타입"
  type        = list(string)
  default     = ["t3.small"]
}

variable "database_engine_version" {
  description = "MySQL 엔진 버전"
  type        = string
  default     = "8.0.46"
}

variable "database_instance_class" {
  description = "RDS 인스턴스 타입"
  type        = string
  default     = "db.t3.small"
}

variable "asg_scaling" {
  description = "ASG 인스턴스 수"
  type        = object({ min_size = number, desired_size = number, max_size = number })
  default     = { min_size = 1, desired_size = 1, max_size = 2 }

  validation {
    condition = (
      var.asg_scaling.min_size >= 1 &&
      var.asg_scaling.min_size <= var.asg_scaling.desired_size &&
      var.asg_scaling.desired_size <= var.asg_scaling.max_size &&
      alltrue([for size in values(var.asg_scaling) : floor(size) == size])
    )
    error_message = "정수로 1 <= min_size <= desired_size <= max_size를 설정하세요."
  }
}

variable "eks_scaling" {
  description = "EKS 노드 수"
  type        = object({ min_size = number, desired_size = number, max_size = number })
  default     = { min_size = 1, desired_size = 1, max_size = 2 }

  validation {
    condition = (
      var.eks_scaling.min_size >= 1 &&
      var.eks_scaling.min_size <= var.eks_scaling.desired_size &&
      var.eks_scaling.desired_size <= var.eks_scaling.max_size &&
      alltrue([for size in values(var.eks_scaling) : floor(size) == size])
    )
    error_message = "정수로 1 <= min_size <= desired_size <= max_size를 설정하세요."
  }
}

