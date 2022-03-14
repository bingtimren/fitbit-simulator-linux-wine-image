# fitbit-simulator-linux-wine-image
Run fitbit simulator (Windows) with wine in a docker container.

Docker image inspired by Marcus Renno's image https://github.com/rennomarcus/dockerimages/tree/master/fitbitos

## To build
`docker build -t bingtimren/fitbit-simulator:linux_wine_v0_9_2 -t bingtimren/fitbit-simulator:linux_wine_latest .`

Then launch the container, install suggested wine packages (if any), and run `winetricks nocrashdialog` inside container, do not login (otherwise leave credential inside container). commit container.

```
$ fitbit-sim-starter -r -i bingtimren/fitbit-simulator:linux_wine_v0_9_2
$ docker exec -it fitbit-sim-starter-socket /bin/bash
root@95affd3d7152:/fitbitos# winetricks nocrashdialog
docker commit fitbit-sim-starter-socket fitbit092

```



## To publish
`docker push bingtimren/fitbit-simulator:linux_wine_v0_9_2`
`docker push bingtimren/fitbit-simulator:linux_wine_latest`
