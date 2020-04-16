# dotnetCoreKubenetes

To test it:  
docker build -t dotnet-helloworld:2.0 .  
docker run -d dotnet-helloworld:2.0  
docker ps should show a container running  
kubectl create -f mydeploy.yaml  
