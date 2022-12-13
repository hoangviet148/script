aws sts get-caller-identity --profile dev >/dev/null 2>&1
aws eks --region ap-southeast-1 update-kubeconfig --name vinbdi-eks-dev >/dev/null 2>&1
kubectl config use-context arn:aws:eks:ap-southeast-1:717054839986:cluster/vinbdi-eks-dev > /dev/null 2>&1
kubectl get Deployment -n vinbase -o custom-columns="NAME:.metadata.name" | sed "s#\(.*\)#'\1'#g"
 
