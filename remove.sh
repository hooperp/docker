docker rm $(docker ps -a -q)
docker rmi $(docker images -q)

docker images
