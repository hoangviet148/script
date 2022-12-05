services=(vinbase-2
          channel-service
          chatbot-gateway
          channel-worker
          admin-vinbase
          passport-service
          action-log-worker
          action-log-service
          sender-worker
          sender-service)

DEV_PATH="../vinbase-prod/helmcharts/vinbase-charts"

for service in ${services[@]}
do
    sed -i "s/0.0.8/0.0.10/g" "$DEV_PATH/$service/Chart.yaml"
done