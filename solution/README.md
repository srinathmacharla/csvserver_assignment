version: '3'
services:
  csvserver:
    image: infracloudio/csvserver:latest
    ports:
      - "9393:9300"
    env_file:
      - csvserver.env
    volumes:
      - ./inputFile:/csvserver/inputdata
---------
docker-compose up -d
[+] Running 2/2
 ✔ Network jkrishna_default        Created                                                                                                                                                             0.1s 
 ✔ Container jkrishna-csvserver-1  Started     
-----------
