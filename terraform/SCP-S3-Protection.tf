provider "aws" {
}

resource "aws_organizations_policy" "scp_s3_protection" {
  name = "s3_protection"
  description = "s3_protection"
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutAccountPublicAccessBlock"
      ],
      "Resource": "*",
      "Effect": "Deny"
    },
    {
      "Action": [
        "s3:PutObject"
      ],
      "Resource": "*",
      "Effect": "Deny",
      "Condition": {
        "StringNotEquals": {
          "s3:x-amz-server-side-encryption": "AES256"
        }
      }
    },
    {
      "Action": [
        "s3:PutObject"
      ],
      "Resource": "*",
      "Effect": "Deny",
      "Condition": {
        "Bool": {
          "s3:x-amz-server-side-encryption": false
        }
      }
    },
    {
      "Action": [
        "s3:DeleteBucket",
        "s3:DeleteObject",
        "s3:DeleteObjectVersion"
      ],
      "Resource": "*",
      "Effect": "Deny"
    },
    {
      "Action": [
        "glacier:DeleteArchive",
        "glacier:DeleteVault"
      ],
      "Resource": "*",
      "Effect": "Deny"
    }
  ]
}
POLICY

}
