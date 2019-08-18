cd ~/m4rr_ru_docker
docker-compose down && git pull && docker-compose build && docker-compose up -d

cd ~/blog-m4rr-deploy
docker-compose down && git pull && docker-compose build && docker-compose up -d

docker stop nginx-proxy
docker rm nginx-proxy

docker run -d -p 80:80 --restart=unless-stopped --name nginx-proxy -e ENABLE_IPV6=true -v /var/run/docker.sock:/tmp/docker.sock jwilder/nginx-proxy

docker network connect m4rrrudocker_default nginx-proxy

docker network connect blogm4rrdeploy_default nginx-proxy
