resource "aws_iam_user" "my_resource1" {
  name = "Abdussamed"
  path = "/"

  tags = {
    tag-key = "tag-value"
    departman = "Yazilim"
  }
}
