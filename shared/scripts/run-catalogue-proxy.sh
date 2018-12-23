#!/bin/bash

term() {
  echo "Caught SIGINT signal!"
  curl --request PUT http://localhost:8500/v1/agent/service/deregister/catalogue-proxy
  kill -TERM "$child" 2>/dev/null
}

trap term SIGINT

private_ip=$1
local_dir=$2
echo "main PID is $$"
echo "private_ip is ${private_ip}"
echo "local_dir is ${local_dir}"
curl --request PUT --data @${local_dir}/catalogue-proxy.json http://localhost:8500/v1/agent/service/register

/usr/local/bin/consul connect proxy -http-addr http://${private_ip}:8500 -sidecar-for catalogue &

child=$!
wait "$child"
