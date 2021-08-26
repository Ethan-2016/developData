echo "-------------------- 发布中 --------------------"
npm install
npm run build
cp Dockerfile dist/
cd dist/
docker build -t registry.apps.dev.szyjian.com/portal .
echo "-------------------- 生在中 --------------------"
docker push registry.apps.dev.szyjian.com/portal
cd ../
kubectl delete -f service.yml
docker images|grep none|awk '{print $3 }'|xargs docker rmi
docker images | grep "portal"
kubectl create -f service.yml
echo "-------------------- 操作完成 --------------------" 
