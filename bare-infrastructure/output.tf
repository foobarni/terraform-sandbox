output "workshop_vpc_id" {
  value = aws_vpc.workshop_vpc.id
}

output "workshop_rt_id" {
  value = aws_route_table.workshop_rt.id
}
