resource "aws_s3_bucket" "example" {
  bucket = "my-adana-izmir-urfa"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
