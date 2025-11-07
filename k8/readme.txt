1) pod
2)deployement
3)service


kubectl apply -f service.yaml  - service will be created
kubectl get svc                - you see the details about service
kubectl get svc -v=9           - you will get entire info about service (how trafic is going)