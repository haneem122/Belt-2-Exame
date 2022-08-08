resource "aws_instance" "app_server" {
    ami = var.ami
    instance_type = "t2.micro"
    tags = {
        Name = "${var.app_region}-app-server"
    }

    
}