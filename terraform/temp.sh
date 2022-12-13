DIR="/home/hoangnv46/Documents/terraform_ng/prod/ap-southeast-1/prod/rds_mysql_asr_logging"
ROLE="arn:aws:iam::921042051488:role/prod-terraform"
folder_to_backup="/home/hoangnv46/Documents/script/terraform/state"

###################################################################

declare -A ec2_instances_1
ec2_instances_1=(['rds_asr']='mysql_asr_logging_security_group')

for instance in ${!ec2_instances_1[@]}
do
    cd $DIR && \
    export AWS_PROFILE=prod && \
    terragrunt state mv -state=$folder_to_backup/rds_asr_old.tfstate -state-out=$folder_to_backup/${instance}.tfstate module.${ec2_instances_1[${instance}]} module.${ec2_instances_1[${instance}]} --terragrunt-iam-role $ROLE 
done

###########################################################

declare -A ec2_sg
ec2_sg=(['rds_asr']='master')

for sg in ${!ec2_sg[@]}
do
    cd $DIR && \
    export AWS_PROFILE=prod && \
    terragrunt state mv -state=$folder_to_backup/rds_asr_old.tfstate -state-out=$folder_to_backup/${sg}.tfstate module.${ec2_sg[${sg}]} module.${ec2_sg[${sg}]} --terragrunt-iam-role $ROLE
done