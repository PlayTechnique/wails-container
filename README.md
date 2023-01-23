# Building
1. clone the upstream wails repo and check out the tag you want to build. 
2. run build.sh with the env file. The wails cli binary will be built inside the container and put into PATH.

# Container on docker hub
docker.io/playtechnique/wailsv2_3_1:0.0.1

# Command info
The default command is version. To run it with a different command, just supply it as an argument. For example, to run
`wails doctor`, use `docker run -it docker.io/playtechnique/wails:v2.3.1 doctor`.

To build something with the containerised wails, you'll need to mount it in. The working directory is set to /home/wails,
so mount your source dir there `docker run -v $(pwd):/home/wails/ -it docker.io/playtechnique/wailsv2_3_1:0.0.1  build`

If you prefer to run entirely inside the container, override the entrypoint
`docker run --entrypoint bash -v $(pwd):/home/wails/ -it docker.io/playtechnique/wailsv2_3_1:0.0.1`
