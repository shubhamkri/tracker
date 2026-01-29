terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "expense_tracker" {
  name = "expense-tracker:latest"
  build {
    context    = ".."
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "app_container" {
  name  = "expense_tracker_app"
  image = docker_image.expense_tracker.name

  ports {
    internal = 8501
    external = 8501
  }

  restart = "always"
}
