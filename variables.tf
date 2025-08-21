variable "ec2_instance-type" {
    default = "t2.micro"
    type = string
}

variable "ec2_root_storage_size" {
    default = 10
    type = number
}

variable "ec2_ami" {
    default = "ami-0f918f7e67a3323f0"
    type = string
}

variable "ec2_instance_name" {
    default = "task-manager"
    type = string
}

variable "security_groups_name" {
    default = "task-manager-sg"
    type = string
}
