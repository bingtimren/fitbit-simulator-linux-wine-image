# fitbit-simulator-linux-wine-image
Run fitbit simulator (Windows) with wine in a docker container.

Docker image inspired by Marcus Renno's image https://github.com/rennomarcus/dockerimages/tree/master/fitbitos

## To build
`docker build -t bingtimren/fitbit-simulator:linux_wine_v0_8_2 -t bingtimren/fitbit-simulator:linux_wine_latest .`

## To publish
`docker push bingtimren/fitbit-simulator:linux_wine_v0_8_2`
`docker push bingtimren/fitbit-simulator:linux_wine_latest`