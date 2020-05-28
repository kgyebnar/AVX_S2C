

resource "aviatrix_vpc" "vpc1_krisz_test" {
    cloud_type = 1
    account_name = "aws-account-pod13"
    name = "aws-us-west-2-krisz-test-vpc1"
    aviatrix_transit_vpc = false
    aviatrix_firenet_vpc = false
    region = "us-west-2"
    cidr = "10.59.1.0/24"

}

resource "aviatrix_gateway" "krisz-testGW" {
    account_name = "aws-account-pod13"
    cloud_type = 1
    gw_name = "krisz-TF-testGW1"
    vpc_id = "${aviatrix_vpc.vpc1_krisz_test.vpc_id}"
    vpc_reg = "us-west-2"
    gw_size = "t2.micro"
    subnet = "${aviatrix_vpc.vpc1_krisz_test.subnets.4.cidr}"
}

resource "aviatrix_vpc" "vpc2_krisz_test" {
    cloud_type = 1
    account_name = "aws-account-pod13"
    name = "aws-us-west-2-krisz-test-vpc2"
    aviatrix_transit_vpc = false
    aviatrix_firenet_vpc = false
    region = "us-west-2"
    cidr = "10.59.2.0/24"

}

resource "aviatrix_gateway" "krisz-testGW2" {
    account_name = "aws-account-pod13"
    cloud_type = 1
    gw_name = "krisz-TF-testGW2"
    vpc_id = "${aviatrix_vpc.vpc2_krisz_test.vpc_id}"
    vpc_reg = "us-west-2"
    gw_size = "t2.micro"
    subnet = "${aviatrix_vpc.vpc2_krisz_test.subnets.4.cidr}"
}

resource "aviatrix_tunnel" "krisz_TF_test_tunnel" {
  count = "1"
  gw_name1 = "${aviatrix_gateway.krisz-testGW.gw_name}"
  gw_name2 = "${aviatrix_gateway.krisz-testGW2.gw_name}"
}

#VPN1 to Onprem

resource "aviatrix_site2cloud" "site2cloud_1" {
    vpc_id = "${aviatrix_vpc.vpc2_krisz_test.vpc_id}"
    connection_name = "VGW-VPN1"
    connection_type = "unmapped"
    remote_gateway_type = "generic"
    tunnel_type = "udp"
    primary_cloud_gateway_name = "krisz-TF-testGW1"
    remote_gateway_ip = "195.228.45.144"
    remote_subnet_cidr = "192.168.1.0/24"
    local_subnet_cidr = "${aviatrix_vpc.vpc2_krisz_test.cidr}"
    ha_enabled = false
    private_route_encryption = ""
    custom_algorithms = false
    phase_1_authentication = ""
    phase_2_authentication = ""
    phase_1_dh_groups = ""
    phase_2_dh_groups = ""
    phase_1_encryption = ""
    phase_2_encryption = ""
    pre_shared_key = ""
    backup_pre_shared_key = ""
    enable_dead_peer_detection = true
}

#VPN2 to Onprem

resource "aviatrix_site2cloud" "site2cloud_2" {
    vpc_id = "${aviatrix_vpc.vpc1_krisz_test.vpc_id}"
    connection_name = "VGW-VPN2"
    connection_type = "unmapped"
    remote_gateway_type = "generic"
    tunnel_type = "udp"
    primary_cloud_gateway_name = "krisz-TF-testGW1"
    remote_gateway_ip = "195.228.45.145"
    remote_subnet_cidr = "192.168.2.0/24"
    local_subnet_cidr = "${aviatrix_vpc.vpc1_krisz_test.cidr}"
    ha_enabled = false
    private_route_encryption = ""
    custom_algorithms = false
    phase_1_authentication = ""
    phase_2_authentication = ""
    phase_1_dh_groups = ""
    phase_2_dh_groups = ""
    phase_1_encryption = ""
    phase_2_encryption = ""
    pre_shared_key = ""
    backup_pre_shared_key = ""
    enable_dead_peer_detection = true
}



