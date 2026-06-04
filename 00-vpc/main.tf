module "vpc" {
    source = "../../terraform-aws-vpc"       #It should be git url in real time projects.
    #source = "git::https://github.com/sai-chandana-ravuri/terraform-aws-vpc.git?ref=main"
    project = var.project_name
    environment = var.environment
    #is_peering_required = true
}
