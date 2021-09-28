tg-init:
	terragrunt run-all init
tg-plan:
	terragrunt run-all plan
tg-apply:
	terragrunt run-all apply --terragrunt-non-interactive
tg-destroy:
	terragrunt run-all destroy