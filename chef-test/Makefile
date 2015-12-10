README.md: README.org
	docker run -v `pwd`:/source jagregory/pandoc --from=org --to=markdown --output=$@ $<
	doctoc --title '' $@

apply: .terraform/
	terraform apply -var-file=~/.ssh/terraform.tfvars -var region=us-west-1 -state=us-west-1.tfstate

destroy:
	terraform destroy -force -var-file=~/.ssh/terraform.tfvars -var region=us-west-1 -state=us-west-1.tfstate

.terraform:
	terraform get -update
