provider "docker" {}

resource "docker_container" "app" {
  name  = "my_app"
  image = var.image       # uses the variable "image"
  ports {
    internal = var.port
    external = var.port
  }
}
