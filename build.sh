echo "-------------------- 编译 --------------------"
npm install
npm run postinstall
npm run build
echo "-------------------- 创建镜像 --------------------"
cp Dockerfile dist/
cd dist/
docker build -t 192.168.1.162:5000/hit/portal:dev .
echo "-------------------- 发布镜像 --------------------"
docker push 192.168.1.162:5000/hit/portal:dev
echo "-------------------- 操作完成 --------------------" 
