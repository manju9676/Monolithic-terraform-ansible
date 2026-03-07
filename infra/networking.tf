resource "aws_vpc" "myvpc" {
  depends_on = [data.aws_s3_bucket.s3]
  tags = {
    Name = "myvpc"
  }
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "private-subnet-1"
  }
  availability_zone = "us-east-1a"
}
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "public-subnet"
  }
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}
resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.3.0/24"
  tags = {
    Name = "public-subnet-1"
  }
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}
resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt"
  }
}
resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.rt1.id
}
