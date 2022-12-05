FOLDER="/home/hoangnv46/Documents/terraform_ng/prod/ap-southeast-1/prod/ec2"
folder_to_backup="/home/hoangnv46/Documents/script/terraform/state"
ROLE="arn:aws:iam::921042051488:role/prod-terraform"

cd $FOLDER && \
terragrunt state pull > $folder_to_backup/ec2.tfstate --terragrunt-iam-role $ROLE
