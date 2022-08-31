resource "aws_s3_bucket" "sulfur" {
  bucket = "sulfur-tfstate"

  tags = {
    Name        = "terrform"
  }
}
