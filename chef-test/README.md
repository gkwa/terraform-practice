<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Example terraform templates](#example-terraform-templates)
- [AWS console for us-west-1](#aws-console-for-us-west-1)
- [Usage](#usage)
- [empty](#empty)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Example terraform templates
===========================

-   <https://github.com/hashicorp/terraform/tree/master/examples>

AWS console for us-west-1
=========================

-   <https://us-west-1.console.aws.amazon.com/ec2/v2/home?region=us-west-1#Instances:sort=instanceState>

Usage
=====

    terraform get -update
    terraform apply -var-file=~/.ssh/terraform.tfvars
    terraform show -module-depth=1
    terraform destroy -force -var-file=~/.ssh/terraform.tfvars

    # Using make:
    make create
    make destroy

empty
=====

    terraform graph -draw-cycles -verbose >o.dot; dot o.dot -Tpng >o.png; open o.png

    [demo@demos-MacBook-Pro:~/pdev/terraform-practice/chef-test(wip)]$  terraform plan -destroy -var region=us-west-1 -state=us-west-1.tfstate -var-file=~/.ssh/terraform.tfvars
    Refreshing Terraform state prior to plan...

    module.vpc.aws_vpc.mod: Refreshing state... (ID: vpc-a3aa28c6)
    aws_security_group.bastion: Refreshing state... (ID: sg-8987a0ec)
    module.vpc.aws_route_table.private: Refreshing state... (ID: rtb-88ad30ed)
    module.vpc.aws_internet_gateway.mod: Refreshing state... (ID: igw-b15986d4)
    module.vpc.aws_subnet.private.0: Refreshing state... (ID: subnet-6d863234)
    module.vpc.aws_subnet.public.0: Refreshing state... (ID: subnet-6e863237)
    module.vpc.aws_subnet.public.1: Refreshing state... (ID: subnet-46a1d623)
    module.vpc.aws_subnet.private.1: Refreshing state... (ID: subnet-41a1d624)
    module.vpc.aws_subnet.private.2: Refreshing state... (ID: subnet-6c863235)
    module.vpc.aws_subnet.public.2: Refreshing state... (ID: subnet-6f863236)
    module.vpc.aws_route_table.public: Refreshing state... (ID: rtb-8bad30ee)
    aws_instance.win2008: Refreshing state... (ID: i-f3968a33)
    module.vpc.aws_route_table_association.private.2: Refreshing state... (ID: rtbassoc-0c2d4a69)
    module.vpc.aws_route_table_association.private.1: Refreshing state... (ID: rtbassoc-0f2d4a6a)
    module.vpc.aws_route_table_association.private.0: Refreshing state... (ID: rtbassoc-0d2d4a68)
    module.vpc.aws_route_table_association.public.0: Refreshing state... (ID: rtbassoc-0e2d4a6b)
    module.vpc.aws_route_table_association.public.1: Refreshing state... (ID: rtbassoc-092d4a6c)
    module.vpc.aws_route_table_association.public.2: Refreshing state... (ID: rtbassoc-082d4a6d)

    Error running plan: 1 error(s) occurred:

     * Cycle: aws_security_group.bastion (destroy), output.ip, aws_security_group.bastion, module.vpc.aws_subnet.public, module.vpc.output.public_subnets, aws_instance.win2008, aws_instance.win2008 (destroy), module.vpc.aws_subnet.public (destroy), module.vpc.aws_vpc.mod (destroy), module.vpc.aws_vpc.mod, module.vpc.output.vpc_id
    [demo@demos-MacBook-Pro:~/pdev/terraform-practice/chef-test(wip)]$

