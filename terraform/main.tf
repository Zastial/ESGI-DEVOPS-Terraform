provider "docker" {}

resource "docker_network" "app_network" {
  name = "${var.project_name}-network"
}

# Images
resource "docker_image" "postgres" {
  name = "postgres:16-alpine"
}

resource "docker_image" "adminer" {
  name = "adminer:latest"
}

resource "docker_image" "api" {
  name = "${var.project_name}-api:latest"
  build {
    context    = "${path.module}/../app"
    dockerfile = "Dockerfile"
  }
}

# Conteneurs
resource "docker_container" "postgres" {
  name  = "postgres"
  image = docker_image.postgres.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }

  env = [
    "POSTGRES_USER=${var.db_user}",
    "POSTGRES_PASSWORD=${var.db_password}",
    "POSTGRES_DB=${var.db_name}"
  ]
}

resource "docker_container" "api" {
  name  = "api"
  image = docker_image.api.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 3000
    external = var.api_port
  }

  env = [
    "APP_ENV=${var.app_env}",
    "PORT=3000",
    "DATABASE_URL=postgres://${var.db_user}:${var.db_password}@postgres:5432/${var.db_name}"
  ]

  depends_on = [docker_container.postgres]
}

resource "docker_container" "adminer" {
  name  = "adminer"
  image = docker_image.adminer.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 8080
    external = var.adminer_port
  }

  depends_on = [docker_container.postgres]
}