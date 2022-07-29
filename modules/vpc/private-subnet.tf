# Configuration section for route table public subnet
resource "aws_route_table" "public_subnet" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    {
      "Name" = format(
        "${var.environment_name}-${var.public_subnet_interfix}",
      )
    },
    var.additional_tags
  )
}