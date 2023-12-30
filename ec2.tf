resource "aws_instance" "aws_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.instance_count
}
resource "aws_s3_bucket" "mybucket" {
  bucket = var.mybucket

}
resource "aws_vpc" "my_aws_vpc" {
  cidr_block = var.cidr_range

}