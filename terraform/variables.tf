variable "image" {
  description = "Docker image to run"
  type        = string
}

variable "port" {
  description = "Port your app will run on"
  type        = number
  default     = 8501
}
