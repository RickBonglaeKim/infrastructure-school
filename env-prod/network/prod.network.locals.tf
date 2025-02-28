
locals {
  prefix = "school_ver.3"
}

locals {
  vpc-cidr = "10.102.0.0/16"

  subnet-database = {
    a = {
      zone = "a"
      name = "${local.prefix}-database-AZ_a-${var.environment}"
      cidr = "10.102.200.0/26"
    }
    b = {
      zone = "b"
      name = "${local.prefix}-database-AZ_b-${var.environment}"
      cidr = "10.102.200.64/26"
    }
    c = {
      zone = "c"
      name = "${local.prefix}-database-AZ_c-${var.environment}"
      cidr = "10.102.200.128/26"
    }
  }

  subnet-private = {
    a = {
      zone = "a"
      name = "${local.prefix}-private-AZ_a-${var.environment}"
      cidr = "10.102.1.0/24"
    }
    b = {
      zone = "b"
      name = "${local.prefix}-private-AZ_b-${var.environment}"
      cidr = "10.102.2.0/24"
    }
    c = {
      zone = "c"
      name = "${local.prefix}-private-AZ_c-${var.environment}"
      cidr = "10.102.3.0/24"
    }
  }

  subnet-public = {
    a = {
      zone = "a"
      name = "${local.prefix}-public-AZ_a-${var.environment}"
      cidr = "10.102.11.0/24"
    }
    b = {
      zone = "b"
      name = "${local.prefix}-public-AZ_b-${var.environment}"
      cidr = "10.102.12.0/24"
    }
    c = {
      zone = "c"
      name = "${local.prefix}-public-AZ_c-${var.environment}"
      cidr = "10.102.13.0/24"
    }
  }

  nat_gateway-allocation_id = "eipalloc-07bd4d6932fc9e18d"

  peering-connection = {
    system = {
      id = "pcx-0f259ae7eb696bfc4"
      cidr = "10.102.200.0/22"
    }
  }

}