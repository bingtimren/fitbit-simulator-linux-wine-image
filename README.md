# fitbit-simulator-linux-wine-image
Run fitbit simulator (Windows) with wine in a docker container.

Docker image inspired by Marcus Renno's image https://github.com/rennomarcus/dockerimages/tree/master/fitbitos

## To build
`docker build -t bingtimren/fitbit-simulator:linux_wine_v0_9_0 -t bingtimren/fitbit-simulator:linux_wine_latest .`

Then launch the container, install suggested wine packages, and run `winetricks nocrashdialog` inside container, commit container.

## To publish
`docker push bingtimren/fitbit-simulator:linux_wine_v0_9_0`
`docker push bingtimren/fitbit-simulator:linux_wine_latest`

## Issues

This container consumes 100% CPU. It still works, and system will not lose response. However, the GUI may feel a bit sluggish and CPU cooling fan will be running. Please let me know if you can come up with a better image that works with the latest fitbit simulator.