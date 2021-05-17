resource "aws_cloudwatch_log_group" "film_rating_app" {
  name = "reify_interview_app"
}

 resource "aws_cloudwatch_log_group" "film_rating_db" {
  name = "reify_interview_db"
}
