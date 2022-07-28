//let us create a local variable to hold this
locals{
  az_names = "${data.aws_availability_zones.azs.names}"
}