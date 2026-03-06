variable "project_name" {
    description = "The name of the project"
    type        = string
}

variable "app_env" {
    description = "The application environment"
    type        = string
}

variable "api_port" {
    description = "The port for the API service"
    type        = number
}

variable "adminer_port" {
    description = "The port for Adminer"
    type        = number
}

variable "db_user" {
    description = "The database user"
    type        = string
    sensitive   = true
}

variable "db_password" {
    description = "The database password"
    type        = string
    sensitive   = true
}

variable "db_name" {
    description = "The database name"
    type        = string
}