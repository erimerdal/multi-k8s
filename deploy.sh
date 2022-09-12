docker build -t erimerdal/multi-client -f ./client/Dockerfile ./client
docker build -t erimerdal/multi-server -f ./server/Dockerfile ./server
docker build -t erimerdal/multi-worker -f ./worker/Dockerfile ./worker
docker push erimerdal/multi-client
docker push erimerdal/multi-server
docker push erimerdal/multi-worker
kubectl apply -f k8s
kubectl rollout restart deployments/server-deployment
kubectl rollout restart deployments/client-deployment
kubectl rollout restart deployments/worker-deployment