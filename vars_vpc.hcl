locals {
    private_subnet_a = "10.0.1.0/24"
    private_subnet_b = "10.0.2.0/24"
    public_subnet_a = "10.0.255.0/24"
    public_subnet_b = "10.0.254.0/24"
    ssh_security_group = ["22"]
    web_security_group = ["80", "443"]
}