locals {
  mysql = {
    engin = "mysql"
    version = "8.4"
    identifier = "school-ver3-${var.environment}"
  }
}