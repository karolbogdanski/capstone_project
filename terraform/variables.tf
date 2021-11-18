variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "user_id" {
  default     = "113304117666"
  description = "User ID"
}

variable "bucket_name" {
  default     = "backup-s3"
  description = "S3 bucket for terraform backup"
}
