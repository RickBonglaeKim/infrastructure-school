
data "terraform_remote_state" "network" {
  backend = "remote"

  config = {
    organization = "i-screamarts-school"
    workspaces = {
      name = "school-infrastructure--network-${var.environment}"
    }
  }
}