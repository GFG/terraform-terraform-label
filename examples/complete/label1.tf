provider "aws" {
  profile = "dev"
  region = "ap-southeast-1"
}
module "label1" {
  source      = "../../"
  project     = "test"
  environment = "dev"
  owner       = "gfg test"
  name        = "Name"
  attributes  = ["1", "2", "3"]
  delimiter   = "-"

  tags = {
    "Test" = "Value"
  }
}

resource "aws_instance" "test_label" {
  ami = "ami-0f02b24005e4aec36"
  instance_type = "t2.micro"

  tags = module.label1.tags
}




#Output label
output "label1_id" {
  value = module.label1.id
}

output "label1_name" {
  value = module.label1.name
}

output "label1_environment" {
  value = module.label1.environment
}

output "label1_project" {
  value = module.label1.project
}

output "label1_owner" {
  value = module.label1.owner
}

output "label1_attributes" {
  value = module.label1.attributes
}

output "label1_tags" {
  value = module.label1.tags
}

output "label1" {
  value = {
    id          = module.label1.id
    owner       = module.label1.owner
    name        = module.label1.name
    environment = module.label1.environment
    project     = module.label1.project
    attributes  = module.label1.attributes
    delimiter   = module.label1.delimiter
  }
}
