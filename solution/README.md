# script : gencsv.sh

#!/bin/bash

start=$1
end=$2

# Generate the CSV file
output_file="inputFile"

# Remove the output file if it already exists
rm -f "$output_file"


for ((i=start; i<=end; i++)); do
    random_number=$((RANDOM % 1000))
    echo "$i, $random_number" >> "$output_file"
done

echo "CSV file '$output_file' has been generated."


### give executable permissions using chmod +X gencsv.sh

## Run the script using below command which generates random numbers and redirects them in to file named inputfile

### ./gencsv.sh 2 8 


# Part 1
# Docker commands : 
1. pull docker images using docker pull

    docker pull infracloudio/csvserver:latest
    docker pull prom/prometheus:v2.45.2
2. Run the docker run command to run container which binds the local port 9393 to container port 9300 and mounts the input file as a v  volume to container with environment color Orange  
    docker run -d -p 9393:9300 -v "$(pwd)/inputFile:/csvserver/inputdata" -e CSVSERVER_BORDER=Orange --name csvserver infracloudio/csvserver:latest

    docker ps ## to check container is up and running fine
3. Run docker logs
4. fetch the csvserver using wget
   wget -O ./part-1-output http://localhost:9393/raw
5. redirect docker logs using docker command
   docker logs 76a>& part-1-logs
6. stop container using below command.
   docker stop <container id>

# PART 2 

prepare docker0-compose file and run it with csvserver.env as environment config.

# PART 3 
1.  Do ifconfig to get the private ip of host.
2. Add private-ip in scrape config of prometheus.yml file to scrape the app metrics.
3. prepare dockercompose.yaml with prometheus container to scrape the csv server metrics with prometheus.yaml as volume mount.
4. Run docker-compose up -d
5. query the prometheus for csvserver_records on <instance-public-ip>:9090
