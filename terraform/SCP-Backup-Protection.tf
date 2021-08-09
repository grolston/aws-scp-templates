provider "aws" {
}

resource "aws_organizations_policy" "scp_backup_protection" {
  name = "backup_protection"
  description = "aws_backup_protection"
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "backup:DeleteBackupVault",
        "backup:DeleteRecoveryPoint"
      ],
      "Resource": "*",
      "Effect": "Deny"
    }
  ]
}
POLICY

}
