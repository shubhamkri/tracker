resource "null_resource" "docker_run" {
  provisioner "local-exec" {
    command = <<EOT
docker run -d -p ${var.port}:${var.port} ${var.image}
EOT
  }
}

# Optional: stop container on destroy
resource "null_resource" "docker_stop" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "docker stop $(docker ps -q --filter ancestor=${var.image}) || true"
  }

  depends_on = [null_resource.docker_run]
}
