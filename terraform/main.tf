terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "app_image" {
  name = var.image_name
  build {
    context    = var.build_context
    dockerfile = var.dockerfile
  }
}

resource "docker_container" "app_container" {
  name  = "streamlit_app"
  image = docker_image.app_image.name   
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}
