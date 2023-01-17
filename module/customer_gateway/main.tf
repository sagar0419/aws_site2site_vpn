#-----------------------------------------
#         CUSTOMER GATEWAY
#-----------------------------------------
resource "aws_customer_gateway" "asl_1_customer_gateway" {
  bgp_asn    = 65128
  ip_address = var.customer_gateway_1_ip
  type       = "ipsec.1"

  tags = {
    Name = var.customer_gateway_1_name
  }
}

resource "aws_customer_gateway" "asl_2_customer_gateway" {
  bgp_asn    = 65128
  ip_address = var.customer_gateway_2_ip
  type       = "ipsec.1"

  tags = {
    Name = var.customer_gateway_2_name
  }
}