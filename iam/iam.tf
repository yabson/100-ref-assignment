variable "test_role_name" { }

variable "s3_access_policy" { }

variable "webserver_profile" { }

resource "aws_iam_role" "test_role" {
  name = var.test_role_name
  managed_policy_arns = [aws_iam_policy.s3_access_policy.arn]
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "assignment-role"
  }
}
 #In order for the Iam role to work we need to create policy and attach to iam role
 #To atttach the policy we have to add lookup managed_policy_arns
resource "aws_iam_policy" "s3_access_policy" {
  name = var.s3_access_policy 
  #"assignment_webserver_s3_access_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:*"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_instance_profile" "webserver_profile" {
  name = var.webserver_profile
  role = aws_iam_role.test_role.name
}

output "instance_profile" {
    value = aws_iam_instance_profile.webserver_profile.name
}
    
