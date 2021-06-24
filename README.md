# Docker
Dockerfile can be found [here](https://github.com/c-raj/litecoin/blob/main/Dockerfile).
1. To build the image: 
```
$ docker build -t charan19/docker-litecoin .
```
2. To run litecoin daemon: 
```
$docker run --rm charan19/docker-litecoin
```
3. To delete an image: 
```
$ docker rmi -f <image_id>
```
4. Pushing dockerfile to docker hub: 
```
$ docker push charan19/docker-litecoin:latest
```
[!] Note: Running docker on an older Macbook air which doesn't support the latest docker version so I'm unable to create a multistage docker file.

# K8s Statefulset
Stateful yaml definition can be found [here](https://github.com/c-raj/litecoin/blob/main/litecoin-statefulset.yaml).
I used GKE to run the K8s cluster. Instructions as follows:
1. Install gcloud and initialize it:
```
$ gcloud init
```
2. Login: 
```
$ gcloud auth login
```
3. Used docker hub as container registry.
4. To get gke cluster: 
```
$ gcloud container clusters get-credentials my-first-cluster-1 --zone us-central1-c
```
5. To apply statefulset config file: 
```
$ kubectl apply -f litecoin-statefulset.yaml
```
6. Get pods: 
```
$ kubectl get pods -l app=litecoin
```
7. To describe the pod: 
```
$ kubectl describe pods litecoin-0
```
8. To see the logs: 
```
$ kubectl logs litecoin-0
```

# CI/CD
I used Jenkinsfile for this section but I'm more comfortable with Github actions. Jenkinsfile can be found [here](https://github.com/c-raj/litecoin/blob/main/Jenkinsfile).

# References
1. https://download.litecoin.org/README-HOWTO-GPG-VERIFY-TEAM-MEMBERS-KEY.txt
2. https://github.com/airstand/litecoin/blob/master/Dockerfile
3. https://zhimin-wen.medium.com/persistent-volume-claim-for-statefulset-8050e396cc51

