//let us create a local variable to hold this
locals{
  az_names = "${data.aws_availability_zones.azs.names}"
}

resource "aws_subnet" "my_vpc_subnet" {
  count = "${length(local.az_names)}" //get the count of all availability zones refering to the local var name
  vpc_id     = var.vpc_id
  cidr_block = "${cidrsubnet(var.vpc_cidr_block, 8, count.index)}"  //8 is the block size and 1 is the number of subnets to create.
  availability_zone = "${local.az_names[count.index]}"  //loop through the count using the index key stored in the local variable

  //tag the created public subnets using the count index concatenated with the word PUblicSubnet.
  tags = {
    Name = "PublicSubnet-${count.index + 1 }"
  }
}