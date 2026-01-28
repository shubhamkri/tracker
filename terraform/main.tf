terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Docker image from DockerHub
resource "docker_image" "expense_tracker" {
  name = var.image_name
}

# Run container
resource "docker_container" "app_container" {
  name  = "expense_tracker_app"
  image = docker_image.expense_tracker.name

  ports {
    internal = 8501
    external = 8501
  }

  restart = "always"
}
