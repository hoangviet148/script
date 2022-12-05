SERVICE_NAME="mrc-service-worker"
PATH_LOCAL="../vinbase-local"

mkdir -p $PATH_LOCAL/helmcharts/vinbase-charts/$SERVICE_NAME
sed "s/SERVICE_NAME/$SERVICE_NAME/g" Chart.yaml > $PATH_LOCAL/helmcharts/vinbase-charts/$SERVICE_NAME/Chart.yaml
sed "s/SERVICE_NAME/$SERVICE_NAME/g" value.yaml > $PATH_LOCAL/helmcharts/vinbase-charts/$SERVICE_NAME/values-local.yaml
sed "s/SERVICE_NAME/$SERVICE_NAME/g" aoa-local.yaml > $PATH_LOCAL/argo-bootstrap/templates/chatbot-local/$SERVICE_NAME.yaml


