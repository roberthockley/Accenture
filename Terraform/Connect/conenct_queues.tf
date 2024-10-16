resource "aws_connect_queue" "sales" {
  #depends_on = [ aws_connect_phone_number.song, aws_connect_hours_of_operation.song ]
  instance_id           = aws_connect_instance.song.id
  name                  = "Demo Sales"
  description           = "Demo Sales"
  hours_of_operation_id = aws_connect_hours_of_operation.song.hours_of_operation_id
  outbound_caller_config {
    outbound_caller_id_name      = "Accenture Song"
    #outbound_caller_id_number_id = "12345678-abcd-1234-abcd-123456789012"
    outbound_flow_id             = data.aws_connect_contact_flow.default_outbound
}