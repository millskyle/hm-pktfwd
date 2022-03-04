docker stop hm-pktfwd_packet-forwarder_1
docker rm hm-pktfwd_packet-forwarder_1

docker build . -t hm-pktfwd
docker-compose up 

