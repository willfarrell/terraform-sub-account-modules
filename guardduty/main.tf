resource "aws_guardduty_detector" "main" {
  enable = true
}

resource "aws_guardduty_member" "main" {
  count              = var.type != "master" ? 1 : 0
  account_id         = aws_guardduty_detector.main.account_id
  detector_id        = var.master_id
  email              = var.email
  invite             = true
  invitation_message = "Please accept GuardDuty invitation."
}
