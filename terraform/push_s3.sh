ec2_instances=(jenkins vpn-jump)
FOLDER="/home/hoangnv46/Documents/terraform_ng/prod/ap-southeast-1/prod/ec2"
ROLE="arn:aws:iam::921042051488:role/prod-terraform"
folder_to_backup="/home/hoangnv46/Documents/script/terraform/state"

for instance in ${ec2_instances[@]}
do 
    cd $FOLDER && mkdir -p ${instance} && \
    cp terragrunt.hcl ${instance}
done

rm $FOLDER/terragrunt.hcl
rm $FOLDER/provider.tf
rm $FOLDER/backend.tf

for instance in ${ec2_instances[@]}
do 
    cd $FOLDER/${instance} && \
    terragrunt state push $folder_to_backup/${instance}.tfstate --terragrunt-iam-role $ROLE
done
