SERVICE_NAME="vosk-server-vinmec"

PATH_DEV="../../argocd/vinbase-dev"
PATH_STG="../../argocd/vinbase-staging"
PATH_PRD="../../argocd/vinbase-prod"

mkdir -p $PATH_DEV/helmcharts/vinbase-charts/$SERVICE_NAME
sed "s/SERVICE_NAME/$SERVICE_NAME/g" Chart.yaml > $PATH_DEV/helmcharts/vinbase-charts/$SERVICE_NAME/Chart.yaml
sed "s/SERVICE_NAME/$SERVICE_NAME/g" value.yaml > $PATH_DEV/helmcharts/vinbase-charts/$SERVICE_NAME/values-dev.yaml
sed "s/SERVICE_NAME/$SERVICE_NAME/g" aoa-dev.yaml > $PATH_DEV/argo-bootstrap/templates/vinbase-dev/$SERVICE_NAME.yaml

# mkdir -p $PATH_STG/helmcharts/vinbase-charts/$SERVICE_NAME
# sed "s/SERVICE_NAME/$SERVICE_NAME/g" Chart.yaml > $PATH_STG/helmcharts/vinbase-charts/$SERVICE_NAME/Chart.yaml
# sed "s/SERVICE_NAME/$SERVICE_NAME/g" value.yaml > $PATH_STG/helmcharts/vinbase-charts/$SERVICE_NAME/values-staging.yaml
# sed "s/SERVICE_NAME/$SERVICE_NAME/g" aoa-stag.yaml > $PATH_STG/argo-bootstrap/templates/vinbase-staging/$SERVICE_NAME.yaml

# mkdir -p $PATH_PRD/helmcharts/vinbase-charts/$SERVICE_NAME
# sed "s/SERVICE_NAME/$SERVICE_NAME/g" Chart.yaml > $PATH_PRD/helmcharts/vinbase-charts/$SERVICE_NAME/Chart.yaml
# sed "s/SERVICE_NAME/$SERVICE_NAME/g" value.yaml > $PATH_PRD/helmcharts/vinbase-charts/$SERVICE_NAME/values-prod.yaml
# sed "s/SERVICE_NAME/$SERVICE_NAME/g" aoa-prod.yaml > $PATH_PRD/argo-bootstrap/templates/vinbase-prod/$SERVICE_NAME.yaml

