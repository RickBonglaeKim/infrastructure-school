locals {
  mysql = {
    engine = "mysql"
    version = "8.4"
    identifier = "school-global-ver3-${var.environment}"
  }
}