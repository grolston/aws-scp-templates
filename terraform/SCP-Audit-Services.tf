provider "aws" {
}

resource "aws_organizations_policy" "scp_audit_services_protection" {
  name = "audit_services_protection"
  description = "audit_services_protection"
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "cloudtrail:StopLogging",
        "cloudtrail:DeleteTrail"
      ],
      "Resource": "*",
      "Effect": "Deny"
    },
    {
      "Action": [
        "config:DeleteConfigRule",
        "config:DeleteConfigurationRecorder",
        "config:DeleteDeliveryChannel",
        "config:StopConfigurationRecorder"
      ],
      "Resource": "*",
      "Effect": "Deny"
    },
    {
      "Action": [
        "guardduty:DeleteDetector",
        "guardduty:DeleteInvitations",
        "guardduty:DeleteIPSet",
        "guardduty:DeleteMembers",
        "guardduty:DeleteThreatIntelSet",
        "guardduty:DisassociateFromMasterAccount",
        "guardduty:DisassociateMembers",
        "guardduty:StopMonitoringMembers",
        "guardduty:UpdateDetector"
      ],
      "Resource": "*",
      "Effect": "Deny"
    },
    {
      "Action": [
        "securityhub:DeleteInvitations",
        "securityhub:DisableSecurityHub",
        "securityhub:DisassociateFromMasterAccount",
        "securityhub:DeleteMembers",
        "securityhub:DisassociateMembers"
      ],
      "Resource": "*",
      "Effect": "Deny"
    },
    {
      "Action": [
        "access-analyzer:DeleteAnalyzer"
      ],
      "Resource": "*",
      "Effect": "Deny"
    },
    {
      "Action": [
        "macie2:DisassociateFromMasterAccount",
        "macie2:DisableOrganizationAdminAccount",
        "macie2:DisableMacie",
        "macie2:DeleteMember"
      ],
      "Resource": "*",
      "Effect": "Deny"
    },
    {
      "Action": [
        "ec2:DeleteFlowLogs",
        "logs:DeleteLogGroup",
        "logs:DeleteLogStream"
      ],
      "Resource": "*",
      "Effect": "Deny"
    }
  ]
}
POLICY

}
