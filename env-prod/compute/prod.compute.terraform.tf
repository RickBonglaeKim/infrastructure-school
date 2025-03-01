terraform {
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.82.2"
    }
  }
  
  cloud { 
    organization = "i-screamarts-school"
    workspaces { 
      name = "school-infrastructure--compute-prod" 
    }
  }
  
}

provider "aws" {
  region = "ap-northeast-2"
}