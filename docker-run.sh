cd ~/m4rr_ru_docker
git pull && docker-compose build

cd ~/blog-m4rr-deploy
git pull && docker-compose build

cd ~
docker stop nginx-proxy

# to build from scratch:
# docker run -d -p 80:80 --rm --restart=unless-stopped --name nginx-proxy -e ENABLE_IPV6=true -v /var/run/docker.sock:/tmp/docker.sock jwilder/nginx-proxy
# https://stackoverflow.com/a/52989931

cd ~/m4rr_ru_docker
docker-compose down

cd ~/blog-m4rr-deploy
docker-compose down
docker-compose up -d

cd ~/m4rr_ru_docker
docker-compose up -d

cd ~
docker network connect m4rrrudocker_default nginx-proxy
docker network connect blogm4rrdeploy_default nginx-proxy

docker start nginx-proxy
