tg-init:
	terragrunt run-all init
tg-plan:
	terragrunt run-all plan
tg-apply:
	terragrunt run-all apply --terragrunt-non-interactive
tg-destroy:
	terragrunt run-all destroy
tg-plan-module:
	terragrunt run-all plan --terragrunt-include-dir ${DIR}
tg-apply-module:
	terragrunt run-all apply --terragrunt-include-dir ${DIR} --terragrunt-non-interactive
tg-destroy-module:
	terragrunt run-all destroy --terragrunt-include-dir ${DIR}