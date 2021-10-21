docker build -t jtraille07/multi-client -f ./client/Dockerfile ./client
docker build -t jtraille07/multi-server -f ./server/Dockerfile ./server
docker build -t jtraille07/multi-worker -f ./worker/Dockerfile ./worker
docker push jtraille07/multi-client
docker push jtraille07/multi-server
docker push jtraille07/multi-worker
kubectl apply -f k8s/
kubectl rollout restart deployments/server-deployment
kubectl rollout restart deployments/client-deployments
kubectl rollout restart deployments/worker-deployment