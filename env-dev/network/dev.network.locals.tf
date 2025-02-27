
locals {
  prefix = "school_ver.3"
}

locals {
  vpc-cidr = "192.168.102.0/24"

  subnet-database = {
    a = {
      zone = "a"
      name = "${local.prefix}-database-AZ_a-${var.environment}"
      cidr = "192.168.102.192/28"
    }
    b = {
      zone = "b"
      name = "${local.prefix}-database-AZ_b-${var.environment}"
      cidr = "192.168.102.208/28"
    }
    c = {
      zone = "c"
      name = "${local.prefix}-database-AZ_c-${var.environment}"
      cidr = "192.168.102.224/28"
    }
  }

  subnet-private = {
    a = {
      zone = "a"
      name = "${local.prefix}-private-AZ_a-${var.environment}"
      cidr = "192.168.102.0/28"
    }
    b = {
      zone = "b"
      name = "${local.prefix}-private-AZ_b-${var.environment}"
      cidr = "192.168.102.16/28"
    }
    c = {
      zone = "c"
      name = "${local.prefix}-private-AZ_c-${var.environment}"
      cidr = "192.168.102.32/28"
    }
  }

  subnet-public = {
    a = {
      zone = "a"
      name = "${local.prefix}-public-AZ_a-${var.environment}"
      cidr = "192.168.102.64/28"
    }
    b = {
      zone = "b"
      name = "${local.prefix}-public-AZ_b-${var.environment}"
      cidr = "192.168.102.80/28"
    }
    c = {
      zone = "c"
      name = "${local.prefix}-public-AZ_c-${var.environment}"
      cidr = "192.168.102.96/28"
    }
  }

  peering-connection = {
    system = {
      id = "pcx-0f259ae7eb696bfc4"
      cidr = "192.168.200.0/22"
    }
  }

}