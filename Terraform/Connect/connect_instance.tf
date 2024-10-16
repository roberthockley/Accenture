resource "aws_connect_instance" "song" {
  identity_management_type          = "CONNECT_MANAGED"
  inbound_calls_enabled             = true
  instance_alias                    = "song-connect"
  outbound_calls_enabled            = true
  contact_lens_enabled              = false
  contact_flow_logs_enabled         = true
  auto_resolve_best_voices_enabled = true
}