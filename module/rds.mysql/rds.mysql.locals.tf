locals {
  mysql = {
    engine = "mysql"
    version = "8.4"
    identifier = "school-ver3-${var.environment}"
  }
}