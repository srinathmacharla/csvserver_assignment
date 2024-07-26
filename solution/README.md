# CSVServer Assignment

## Overview

This repository contains the solution for the CSVServer assignment. It involves running a Docker container, generating a CSV file, configuring environment variables, and setting up Prometheus for monitoring. The assignment is divided into three parts:

1. **Part I**: Running the CSVServer container, generating CSV files, and verifying accessibility.
2. **Part II**: Setting up Docker Compose for the CSVServer container.
3. **Part III**: Adding Prometheus for monitoring with Docker Compose.

## Prerequisites

1. Docker: [Installation Guide](https://docs.docker.com/get-started/)
2. Docker Compose: [Getting Started](https://docs.docker.com/compose/gettingstarted/)
3. Prometheus: [Getting Started](https://prometheus.io/docs/prometheus/latest/getting_started/)

## Part I

### 1. Run the Container

  1.  Pull the Docker images:-

    docker pull infracloudio/csvserver:latest
    docker pull prom/prometheus:v2.45.2
    
  2.  Run the CSVServer container:-
     
     docker run -d --name csvserver infracloudio/csvserver:latest

  3.  Check if the container is running:-

     docker ps
     
### 2. Create the Bash Script
    
   1.  Create and edit the gencsv.sh script:-
     
            #!/bin/bash

            start_index=$1
            end_index=$2
            output_file="inputFile"

            > $output_file

            for ((i=start_index; i<=end_index; i++)); do
            echo "$i, $((RANDOM % 100))" >> $output_file
            done
 

    2. Make the script executable:-
       
       chmod +x gencsv.sh

### 3. Generate the inputFile
  
  ./gencsv.sh 2 8


### 4. Run the Container with the File

   Run the container with the generated file:-

   docker run -d -p 9393:9393 --name csvserver -e CSVSERVER_BORDER=Orange -v "$(pwd)/inputFile:/app/inputFile" infracloudio/csvserver:latest

### 5. Verify Accessibility

  Check the application at http://localhost:9393.

### 6.  Create Required Files

   1. Save the run command:-

    echo 'docker run -d -p 9393:9393 --name csvserver -e CSVSERVER_BORDER=Orange -v "$(pwd)/inputFile:/app/inputFile" infracloudio/csvserver:latest' > part-1-cmd

   2. Get the output from the application:-
      
      curl -o ./part-1-output http://localhost:9393/raw

   3. Save container logs:-

      docker logs csvserver >& part-1-logs

