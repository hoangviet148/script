DIR="/home/hoangnv46/Documents/terraform_ng/prod/ap-southeast-1/prod/ec2"
ROLE="arn:aws:iam::921042051488:role/prod-terraform"
folder_to_backup="/home/hoangnv46/Documents/script/terraform/state"

declare -A ec2_instances_1
ec2_instances_1=(['cicd']='ec2' 
                 ['data_viz']='ec2_data_viz'
                 ['elasticsearch']='ec2_es["one"]'
                 ['etl']='ec2_etl'
                 ['jenkins_slave']='jenkins_slave'
                 ['kafka']='ec2_kafka["one"]'
                 ['kong']='ec2_kong'
                 ['kong_cluster']='ec2_kong_control_node'
                 ['tagging2_mongodb']='ec2_tagging2'
                 ['tagging_mongodb']='ec2_mongodb')

declare -A ec2_instances_2
ec2_instances_2=(['elasticsearch']='ec2_es["two"]'
                 ['kafka']='ec2_kafka["two"]'
                 ['kong_cluster']='ec2_kong_data_node')

declare -A ec2_instances_3
ec2_instances_3=(['elasticsearch']='ec2_es["three"]'
                 ['kafka']='ec2_kafka["three"]')

declare -A arrays_ec2
arrays_ec2=(
    ec2_instances_1
    ec2_instances_2
    ec2_instances_3
)
for array in ${arrays_ec2[@]}
do  
    echo $array
    for instance in ${!array[@]}
    do
        cd $DIR && \
        terragrunt state mv -state=$folder_to_backup/ec2.tfstate -state-out=$folder_to_backup/${instance}.tfstate module.${ec2_instances[${instance}]} module.${ec2_instances[${instance}]} --terragrunt-iam-role $ROLE 
    done
done


declare -A ec2_sg
ec2_sg=(['cicd']='ec2_security_group' 
        ['data_viz']='ec2_data_viz_security_group'
        ['elasticsearch']='ec2_es_security_group'
        ['etl']='ec2_etl_security_group'
        ['jenkins_slave']='jenkins_slave_security_group'
        ['kafka']='ec2_kafka_security_group'
        ['kong']='kong_security_group'
        ['kong_cluster']='kong_cluster_security_group')

for sg in ${!ec2_sg[@]}
do
    cd $DIR && \
    terragrunt state mv -state=$folder_to_backup/ec2.tfstate -state-out=$folder_to_backup/${sg}.tfstate module.${ec2_sg[${sg}]} module.${ec2_sg[${sg}]} --terragrunt-iam-role $ROLE
done


declare -A aws_lb_target_group_1
aws_lb_target_group_1=(['data_viz']='data_viz_metabase'
                     ['etl']='etl'
                     ['kong']='kong'
                     ['tagging2_mongodb']='tagging2-8080')

declare -A aws_lb_target_group_2
aws_lb_target_group_2=(['tagging2_mongodb']='tagging2-8080')

declare -A arrays_lb
arrays_lb=(
    "aws_lb_target_group_1"
    "aws_lb_target_group_2"
)
for array in ${arrays_lb}
do
    for item in ${!array[@]}
    do
        cd $DIR && \
        terragrunt state mv -state=$folder_to_backup/ec2.tfstate -state-out=$folder_to_backup/${item}.tfstate aws_lb_target_group.${aws_lb_target_group[${item}]} aws_lb_target_group.${aws_lb_target_group[${item}]} --terragrunt-iam-role $ROLE
    done
done


declare -A aws_lb_target_group_attachment_1
aws_lb_target_group_attachment_1=(['data_viz']='data_viz_metabase'
                                ['etl']='etl'
                                ['kong']='kong'
                                ['tagging2_mongodb']='tagging2-8080')

declare -A aws_lb_target_group_attachment_2
aws_lb_target_group_attachment_2=(['tagging2_mongodb']='tagging2-8080')

declare arrays_lb_att=(
    "aws_lb_target_group_attachment_1"
    "aws_lb_target_group_attachment_2"
)
for array in ${arrays_lb_att}
do
    for item in ${!array[@]}
    do
        cd $DIR && \
        terragrunt state mv -state=$folder_to_backup/ec2.tfstate -state-out=$folder_to_backup/${item}.tfstate aws_lb_target_group_attachment.${aws_lb_target_group_attachment[${item}]} aws_lb_target_group_attachment.${aws_lb_target_group_attachment[${item}]} --terragrunt-iam-role $ROLE
    done
done


declare -A aws_ebs_volumes
aws_ebs_volumes=(['elasticsearch']='volume'
                 ['kafka']='volume_kafka'
                 ['tagging_mongodb']='tagging')

for item in ${!aws_ebs_volumes[@]}
do
    cd $DIR && \ 
    terragrunt state mv -state=$folder_to_backup/ec2.tfstate -state-out=$folder_to_backup/${item}.tfstate aws_ebs_volume.${aws_ebs_volumes[${item}]} aws_ebs_volume.${aws_ebs_volumes[${item}]} --terragrunt-iam-role $ROLE
done


declare -A aws_volume_attachments_1
aws_volume_attachments_1=(['cicd']='root_cicd' 
                        ['elasticsearch']='attachment'
                        ['kafka']='attachment_kafka'
                        ['tagging_mongodb']='tagging')

declare -A aws_volume_attachments_2
aws_volume_attachments_2=(['cicd']='this_ec2')

declare arrays_vol_att=(
    "aws_volume_attachments_1"
    "aws_volume_attachments_2"
)
for array in ${arrays_vol_att}
do
    for item in ${!array[@]}
    do
        cd $DIR && \
        terragrunt state mv -state=$folder_to_backup/ec2.tfstate -state-out=$folder_to_backup/${item}.tfstate aws_volume_attachment.${aws_volume_attachments[${item}]} aws_volume_attachment.${aws_volume_attachments[${item}]} --terragrunt-iam-role $ROLE
    done
done

