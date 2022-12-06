ec2_instances=(cicd data_viz elasticsearch etl jenkins_slave kafka kong kong_cluster neo4j)
FOLDER="/home/hoangnv46/Documents/terraform_ng/prod/ap-southeast-1/prod/ec2"
ROLE="arn:aws:iam::921042051488:role/prod-terraform"
folder_to_backup="/home/hoangnv46/Documents/script/terraform/state"

for instance in ${ec2_instances[@]}
do 
    cd $FOLDER && mkdir -p ${instance} && \
    cp terragrunt.hcl ${instance} && \
    mv ${instance}.tf ./${instance}
done

rm $FOLDER/terragrunt.hcl
rm $FOLDER/provider.tf
rm $FOLDER/backend.tf

rm $FOLDER/.terraform.lock.hcl
rm -rf $FOLDER/.terraform

for instance in ${ec2_instances[@]}
do 
    cd $FOLDER/${instance} && \
    terragrunt state push $folder_to_backup/${instance}.tfstate --terragrunt-iam-role $ROLE
done
