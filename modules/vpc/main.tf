resource "aws_vpc" "this" {
    cidr_block          = var.vpc_cidr
    enable_dns_support  = true
    enable_dns_hostname = true

    tags = merge(var.tags, {
        Name = "${var.tags["Environment]}-vpc"
    })
}

resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.id

    tags = merge(var.tags, {
        Name = "${var.tags["Environment]}-vpc"
    })
}

# Public Subnet
resource "aws_subnet" "public" {
    count                   = length(var.public_subnets)
    vpc_id                  = aws_vpc.this.id
    cidr_block              = var.public_subnets[count.index]
    availability_zone       = var.azs[count.index]
    map_public_ip_on_lunch  = true

    tags = merge(var.tags, {
    Name = "${var.tags["Environment"]}-public-${count.index + 1}"
  })
}

# Private Subnet
resource "aws_subnet" "private" {
    count                   = length(var.private_subnets)
    vpc_id                  = aws_vpc.this.id
    cidr_block              = var.private_subnets[count.index]
    availability_zone       = var.azs[count.index]

    tags = merge(var.tags, {
    Name = "${var.tags["Environment"]}-private-${count.index + 1}"
  })    
}

resource "aws_route_table" "public" {
    vpc_id      = aws_vpc.this.id


    route {
        cidr_block      = "0.0.0.0/0"
        gateway_id      = aws_internet_gateway.this.id
    }

    tags = merge(var.tags, {
    Name = "${var.tags["Environment"]}-public-rt"
  })
}

resource "aws_route_table_association"  "public" {
    count           = length(aws_subnet.public)
    subnet_id       = aws_subnet.public[count.index].id
    route_table_id  = aws_route_table.public.this.id
}
