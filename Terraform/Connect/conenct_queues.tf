resource "aws_connect_queue" "sales" {
  instance_id           = aws_connect_instance.song.id
  name                  = "Demo Sales"
  description           = "Demo Sales"
  hours_of_operation_id = aws_connect_hours_of_operation.song.id
}