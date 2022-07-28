output "subnet_id" {
  value = aws_subnet.my_vpc_subnet.id
}

output "my_vpc_route_table_id" {
  value = aws_route_table.my_vpc_route_table.id
}