resource "aws_s3_bucket" "my_bucket" {
    bucket = "terra-bucket-test-db"

    tags = {
        Name = "terra-bucket-test-db"
    }
}