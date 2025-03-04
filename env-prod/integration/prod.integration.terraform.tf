terraform {
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.79.0"
    }
  }
  
  cloud {
    organization = "i-screamarts-school" 
    workspaces { 
      name = "school-infrastructure--integration-prod"
    } 
  } 
  
}

provider "aws" {
  region = "ap-northeast-2"
}