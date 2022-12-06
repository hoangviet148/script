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

declare -A arrays_ec2=( (['test_1']=1) (['test_2']=2) )
echo ${arrays_ec2[0,0]}
for array in "${arrays_ec2[@]}"
do  
    echo "${array[*]}"
    for item in ${!array[@]}
    do
        echo test
    done
done