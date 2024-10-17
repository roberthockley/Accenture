output "connect" {
    value = aws_connect_instance.song
}

output "hours" {
    value = aws_connect_hours_of_operation.song
}

output "queue" {
    value = aws_connect_queue.sales
}
output "test" {
    value = aws_connect_queue.sales.queue_id
}