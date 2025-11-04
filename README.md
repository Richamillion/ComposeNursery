# Compose Nursery
<p align="center"><img src="https://user-images.githubusercontent.com/2771251/132473388-9f0ff8d9-7bbb-47e5-b45f-9634d86a0dff.png" height="250"></p>

Fork of ContainerNursery, this application acts as a HTTP reverse proxy and starts Docker containers and Compose Stacks on request and stops those which haven't been accessed in a set time period. Compose Nursery also makes sure there are no more active WebSocket connections before stopping the container.

You can find out more information on the original project here: https://github.com/ItsEcholot/ContainerNursery

An example config can be found in the config folder, it includes both a docker compose example and a docker run example. If using the docker compose command be sure to map the volume where your docker-compose file exists. An example docker run command to match the example config can be found below:

docker run -d --name composenursery -v "/$configfolderpath:/app/config" -v "/$immichfolderpath:/app/immich" -v "/var/run/docker.sock:/var/run/docker.sock" composenursery
