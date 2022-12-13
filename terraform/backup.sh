FOLDER="/home/hoangnv46/Documents/terraform_ng/prod/ap-southeast-1/prod/rds_mysql_asr_logging"
file_to_backup="/home/hoangnv46/Documents/script/terraform/state/rds_asr_old.tfstate"
ROLE="arn:aws:iam::921042051488:role/prod-terraform"

cd $FOLDER && \
export AWS_PROFILE=prod && \
terragrunt state pull > $file_to_backup --terragrunt-iam-role $ROLE
