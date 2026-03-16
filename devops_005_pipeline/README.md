============== Terraform =============

Terraform makinesi için bir admin rolü oluşturduk.

Bir makine Amazon Linux EC2 aldık.

---
Username

ec2-user

---
AMI ID

ami-02dfbd4ff395f2a1b


---
Makineneye de StaticIP verdik.

---

Terraform'u makineye kuracağız.

Linux -> Package manager -> Amazon Linux

https://developer.hashicorp.com/terraform/install


```
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install terraform -y
```

Çalışma klasörü oluşturduk.
```
mkdir my-workspace-terraform
```

içine girdik.
```
cd my-workspace-terraform
```

### Çalışma dosyası oluşturduk.

---

```
vi my-user.tf
```

```
resource "aws_iam_user" "my_resource1" {
  name = "Abdussamed"
  path = "/"

  tags = {
    tag-key = "tag-value"
  }
}
```

---

```
vi my-bucket.tf
```

```
resource "aws_s3_bucket" "example" {
  bucket = "my-adana-izmir-urfa"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
```

---

```
vi my-group-membership.tf
```

```
resource "aws_iam_group_membership" "A_Team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user1.name,
    aws_iam_user.user2.name,
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "DevSecOps-Test-Group"
}

resource "aws_iam_user" "user1" {
  name = "Mehmet"
}

resource "aws_iam_user" "user2" {
  name = "Erdic"
}
```
---

```
vi my-provider.tf
```

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = 11111111111111
  secret_access_key = 222222222222222
}
```





