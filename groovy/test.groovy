// vinbase_dev = "aws eks --region ap-southeast-1 --profile dev update-kubeconfig --name vinbdi-eks-dev > /dev/null 2>&1 && \
// kubectl config use-context arn:aws:eks:ap-southeast-1:717054839986:cluster/vinbdi-eks-dev > /dev/null 2>&1 && \
// kubectl get Deployment -n vinbase -o custom-columns=:.metadata.name --no-headers"

// // def vinbase_prod = "aws eks --region ap-southeast-1 --profile prod update-kubeconfig --name vinbdi-eks-prod > /dev/null 2>&1 && \
// // kubectl config use-context arn:aws:eks:ap-southeast-1:921042051488:cluster/vinbdi-eks-prod >/dev/null 2>&1 && \
// // kubectl get Deployment -n vinbase -o custom-columns=:.metadata.name --no-headers"

file = new File('./list.txt').text
vinbase_dev_test = file.readLines()
// print vinbase_dev_test.getClass()
//print vinbase_dev_test

def sh(cmd) {
    def proc = ["/bin/sh", "-c", cmd].execute()
}

def get_vinbase_services(env) {
    // print env.getClass()
    //def cmd2 = sh(env)
    //cmd2.waitFor() 
    def services_list = env.inspect().tokenize(',[]')
    print services_list
}

get_vinbase_services(vinbase_dev_test)


// return [
// 'a',
// 'b'
// ]