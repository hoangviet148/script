FOLDER="/home/hoangnv46/Documents/terraform_ng/prod/ap-southeast-1/prod/ec2/kong_cluster"
file_to_backup="/home/hoangnv46/Documents/script/terraform/state/kong_cluster_old.tfstate"
ROLE="arn:aws:iam::921042051488:role/prod-terraform"

cd $FOLDER && \
terragrunt state pull > $file_to_backup --terragrunt-iam-role $ROLE
