echo "-------------------- 发布中 --------------------"
name=$1
if [ $name == "beida" ];then
   sed -i "s/南方医科大学深圳医院/北京大学深圳医院/g" .env.development
   cp -f src/assets/img/beida.png src/assets/img/website_logo.png
elif [ $name == "yantian" ];then
   sed -i "s/南方医科大学深圳医院/深圳市盐田区人民医院/g" .env.development
   cp -f src/assets/img/yantian.png src/assets/img/website_logo.png
elif [ $name == "nanfangyi" ];then
   sed -i "s/南方医科大学深圳医院/南方医科大学深圳医院/g" .env.development
   cp -f src/assets/img/nanfangyi.png src/assets/img/website_logo.png
elif [ $name == "shanda" ];then
   sed -i "s/南方医科大学深圳医院/汕头大学医学院第一附属医院/g" .env.development
   cp -f src/assets/img/shanda.png src/assets/img/website_logo.png
else
   exit
   echo "没有这样的客户节点(支持的客户节点:beida、shanda、yantian、nanfangyi)"
fi
cnpm install
cnpm run build-dev
cp Dockerfile dist/
cd dist/
docker build -t registry.apps.dev.szyjian.com/portal .
echo "-------------------- 发布完成，清理缓存 --------------------"
cd ../
rm -rf dist
git reset --hard
echo "-------------------- 操作完成 --------------------"