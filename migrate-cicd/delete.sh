OLD_SERVICE_NAME="crawler-worker"
NEW_SERVICE_NAME="crawl-worker"

PATH_DEV="../vinbase-dev"
PATH_STG="../vinbase-staging"
PATH_PRD="../vinbase-prod"

mv $PATH_DEV/helmcharts/vinbase-charts/$OLD_SERVICE_NAME $PATH_DEV/helmcharts/vinbase-charts/$NEW_SERVICE_NAME
mv $PATH_DEV/argo-bootstrap/templates/vinbase-dev/$OLD_SERVICE_NAME.yaml $PATH_DEV/argo-bootstrap/templates/vinbase-dev/$NEW_SERVICE_NAME.yaml

mv $PATH_STG/helmcharts/vinbase-charts/$OLD_SERVICE_NAME $PATH_STG/helmcharts/vinbase-charts/$NEW_SERVICE_NAME
mv $PATH_STG/argo-bootstrap/templates/vinbase-staging/$OLD_SERVICE_NAME.yaml $PATH_STG/argo-bootstrap/templates/vinbase-staging/$NEW_SERVICE_NAME.yaml

mv $PATH_PRD/helmcharts/vinbase-charts/$OLD_SERVICE_NAME $PATH_PRD/helmcharts/vinbase-charts/$NEW_SERVICE_NAME
mv $PATH_PRD/argo-bootstrap/templates/vinbase-prod/$OLD_SERVICE_NAME.yaml $PATH_PRD/argo-bootstrap/templates/vinbase-prod/$NEW_SERVICE_NAME.yaml

