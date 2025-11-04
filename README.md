# Compose Nursery
<p align="center"><img src="logo512.png" height="250"></p>

Fork of ContainerNursery, this application acts as a HTTP reverse proxy and starts Docker containers and Compose Stacks on request and stops those which haven't been accessed in a set time period. Compose Nursery also makes sure there are no more active WebSocket connections before stopping the container.

You can find out more information on the original project here: https://github.com/ItsEcholot/ContainerNursery

An example config can be found in the config folder, it includes both a docker compose example and a docker run example. If using the docker compose command be sure to match where you map your volumes to where your docker-compose files exist.

In the config.yml:
startCommand: "docker compose -f /app/immich/docker-compose.yml -p immich up -d"
stopCommand: "docker compose -f /app/immich/docker-compose.yml -p immich down"

In your docker run/compose:
-v "/$immichfolderpath:/app/immich"

If you wish to proxy the docker socket (more secure, recommended) do not map the docker socket with -v and instead, add the following value:
-e DOCKER_HOST="tcp://DNS_NAME:PORT" or -e DOCKER_HOST="tcp://IP_ADDRESS:PORT"

Full run examples:
# Without Proxy
docker run -d --name ghcr.io/richamillion/composenursery -v "/$configfolderpath:/app/config" -v "/$immichfolderpath:/app/immich" -v "/var/run/docker.sock:/var/run/docker.sock" composenursery
# With Proxy
Docker run example:
docker run -d --name ghcr.io/richamillion/composenursery -v "/$configfolderpath:/app/config" -v "/$immichfolderpath:/app/immich" -e DOCKER_HOST="tcp://docker-socket-proxy:2375" composenursery
