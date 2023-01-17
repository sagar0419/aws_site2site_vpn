#-----------------------------------------
#         SITE-TO-SITE-VPN
#-----------------------------------------

#----------------------------
#   VPN-GATEWAY CONNECTIVITY
#----------------------------
resource "aws_vpn_gateway" "vpn_gateway" {
  vpc_id = var.vpc_id
}

#-----------------------
#   AF-SOUTH-1
#-----------------------
resource "aws_vpn_connection" "vpn_connection_1" {
  customer_gateway_id                  = var.asl_1_customer_gateway
  vpn_gateway_id                       = aws_vpn_gateway.vpn_gateway.id
  outside_ip_address_type              = "PublicIpv4"
  type                                 = "ipsec.1"
  tunnel1_phase1_encryption_algorithms = ["AES256"]
  tunnel1_phase2_encryption_algorithms = ["AES256"]
  tunnel2_phase1_encryption_algorithms = ["AES256"]
  tunnel2_phase2_encryption_algorithms = ["AES256"]
  tunnel1_phase1_integrity_algorithms  = ["SHA2-256"]
  tunnel1_phase2_integrity_algorithms  = ["SHA2-256"]
  tunnel2_phase1_integrity_algorithms  = ["SHA2-256"]
  tunnel2_phase2_integrity_algorithms  = ["SHA2-256"]
  tunnel1_phase1_lifetime_seconds      = "28800"
  tunnel2_phase1_lifetime_seconds      = "28800"
  tunnel1_phase2_lifetime_seconds      = "3600"
  tunnel2_phase2_lifetime_seconds      = "3600"
  tunnel1_startup_action               = "start"
  tunnel2_startup_action               = "start"
  tunnel1_dpd_timeout_action           = "restart"
  tunnel2_dpd_timeout_action           = "restart"
  tunnel1_ike_versions                 = ["ikev2"]
  tunnel2_ike_versions                 = ["ikev2"]
  tunnel1_phase1_dh_group_numbers      = [14]
  tunnel1_phase2_dh_group_numbers      = [14]  
  tunnel2_phase1_dh_group_numbers      = [14]
  tunnel2_phase2_dh_group_numbers      = [14]

  tags = {
    Name = var.customer_gateway_1_name
  }
}

#-----------------------
#   AF-SOUTH-2
#-----------------------
resource "aws_vpn_connection" "vpn_connection_2" {
  customer_gateway_id                  = var.asl_2_customer_gateway
  vpn_gateway_id                       = aws_vpn_gateway.vpn_gateway.id
  outside_ip_address_type              = "PublicIpv4"
  type                                 = "ipsec.1"
  tunnel1_phase1_encryption_algorithms = ["AES256"]
  tunnel1_phase2_encryption_algorithms = ["AES256"]
  tunnel2_phase1_encryption_algorithms = ["AES256"]
  tunnel2_phase2_encryption_algorithms = ["AES256"]
  tunnel1_phase1_integrity_algorithms  = ["SHA2-256"]
  tunnel1_phase2_integrity_algorithms  = ["SHA2-256"]
  tunnel2_phase1_integrity_algorithms  = ["SHA2-256"]
  tunnel2_phase2_integrity_algorithms  = ["SHA2-256"]
  tunnel1_phase1_lifetime_seconds      = "28800"
  tunnel2_phase1_lifetime_seconds      = "28800"
  tunnel1_phase2_lifetime_seconds      = "3600"
  tunnel2_phase2_lifetime_seconds      = "3600"  
  tunnel1_startup_action               = "start"
  tunnel2_startup_action               = "start"
  tunnel1_dpd_timeout_action           = "restart"
  tunnel2_dpd_timeout_action           = "restart"
  tunnel1_ike_versions                 = ["ikev2"]
  tunnel2_ike_versions                 = ["ikev2"]
  tunnel1_phase1_dh_group_numbers      = [14]
  tunnel1_phase2_dh_group_numbers      = [14]  
  tunnel2_phase1_dh_group_numbers      = [14]
  tunnel2_phase2_dh_group_numbers      = [14]

  tags = {
    Name = var.customer_gateway_2_name
  }
}