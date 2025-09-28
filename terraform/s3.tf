resource "aws_s3_bucket" "mys3bucket" {
  bucket = var.s3bucket

  tags = {
    Name        = "My S3 Bucket"
    Environment = var.env
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.mys3bucket.id

  versioning_configuration {
    status = "Enabled"  # or "Suspended" to disable
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mys3bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = false
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [var.account_id]  # Replace with real account ID
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.mys3bucket.arn,
      "${aws_s3_bucket.mys3bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.mys3bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}
