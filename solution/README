docker images ls

docker run -it --name demo --mount type=bind,source"$(pwd)/inputFile",target=/csvserver/inputdata infracloudio/csvserver

docker exec -it demo sh

docker stop demo docker rm demo

docker run -it --name demo --mount type=bind,source="$(pwd)/inputFile",target="/csvserver/inputdata" -p 9393:9300 infracloudio/csvserver docker run -it --name demo --mount type=bind,source="$(pwd)/inputFile",target="/csvserver/inputdata" -p 9393:9300 -e CSVSERVER_BORDER=Orange infracloudio/csvserver

docker-compose up -d
