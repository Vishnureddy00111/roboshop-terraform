default:
rm -rf .terraform
terraform init -backend-config=$(env)/state.tfvars
terraform $(action) -auto-approve -var-file=env-$(env)/main.tfvars

dev:
rm -rf .terraform
terraform init -backend-config=env-dev/state.tfvars
terraform apply -auto-approve -var-file=env-dev/main.tfvars

dev-destroy:
rm -rf .terraform
terraform init -backend-config=env-dev/state.tfvars
terraform destroy -auto-approve -var-file=env-dev/main.tfvars

prod:
rm -rf .terraform
terraform init -backend-config=prod/state.tfvars
terraform apply -auto-approve -var-file=env-prod/main.tfvars



prod-destroy:
rm -rf .terraform
terraform init -backend-config=prod/state.tfvars
terraform destroy -auto-approve -var-file=env-prod/main.tfvars