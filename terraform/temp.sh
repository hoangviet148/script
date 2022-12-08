DIR="/home/hoangnv46/Documents/terraform_ng/prod/ap-southeast-1/prod/ec2/kong_cluster"
ROLE="arn:aws:iam::921042051488:role/prod-terraform"
folder_to_backup="/home/hoangnv46/Documents/script/terraform/state"

###################################################################

declare -A ec2_instances_1
ec2_instances_1=(['kong_cluster']='ec2_kong_control_node')

declare -A ec2_instances_2
ec2_instances_2=(['kong_cluster']='ec2_kong_data_node')

for instance in ${!ec2_instances_1[@]}
do
    cd $DIR && \
    terragrunt state mv -state=$folder_to_backup/kong_cluster_old.tfstate -state-out=$folder_to_backup/${instance}.tfstate module.${ec2_instances_1[${instance}]} module.${ec2_instances_1[${instance}]} --terragrunt-iam-role $ROLE 
done

for instance in ${!ec2_instances_2[@]}
do
    cd $DIR && \
    terragrunt state mv -state=$folder_to_backup/kong_cluster_old.tfstate -state-out=$folder_to_backup/${instance}.tfstate module.${ec2_instances_2[${instance}]} module.${ec2_instances_2[${instance}]} --terragrunt-iam-role $ROLE 
done

###########################################################

declare -A ec2_sg
ec2_sg=(['kong_cluster']='kong_cluster_security_group')

for sg in ${!ec2_sg[@]}
do
    cd $DIR && \
    terragrunt state mv -state=$folder_to_backup/kong_cluster_old.tfstate -state-out=$folder_to_backup/${sg}.tfstate module.${ec2_sg[${sg}]} module.ec2_kong_cluster_security_group --terragrunt-iam-role $ROLE
done
