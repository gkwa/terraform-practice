all: plan
all: README.md

apply: .terraform/
	terraform apply -var-file=secrets.tfvars

.terraform:
	terraform get

plan:
	terraform plan -var-file=secrets.tfvars

aws-two-tier:
	terraform init github.com/hashicorp/terraform/examples/aws-two-tier

examples: terraform/examples/
terraform/examples/:
	git clone https://github.com/hashicorp/terraform.git

dp: destroy_plan
destroy_plan:
	terraform plan -destroy -var-file=secrets.tfvars

readme: README.md

%.md : %.org
	docker run -v `pwd`:/source jagregory/pandoc --from=org --to=markdown --output=$@ $<
	doctoc --title 'terraform-practice' $@

veryclean:
	rm -rf .terraform
