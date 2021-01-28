docker run -dit --name sharp --volume "${PWD}:/mnt/sharp" --workdir /mnt/sharp arm64v8/debian:bullseye
docker exec sharp sh -c "apt-get update && apt-get install -y build-essential git python3 curl"
docker exec sharp sh -c "curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -"
docker exec sharp sh -c "echo 'deb https://deb.nodesource.com/node_14.x sid main' >/etc/apt/sources.list.d/nodesource.list"
docker exec sharp sh -c "apt-get update && apt-get install -y nodejs"
docker exec sharp sh -c "npm install --build-from-source --unsafe-perm"
docker exec sharp sh -c "npm test"
docker exec sharp sh -c "npx prebuild --runtime napi --target 3"
