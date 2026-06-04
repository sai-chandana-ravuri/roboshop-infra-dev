module "sg" {
    count = length(var.sg_names)
    source = "../../terraform-aws-sg"       #It should be git url in real time projects.
    #source = "git::https://github.com/sai-chandana-ravuri/terraform-aws-vpc.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    #is_peering_required = true
    sg_name = replace(var.sg_names[count.index], "_", "-")
    vpc_id = local.vpc_id
}
