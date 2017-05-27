# build-base

Base docker image used for other build images.

# *-build

All the build repositories follow the following conventions.

1. The application/library and possibly their dependencies which need to be built from source are attached as a git submodules.
2. An optional `Dockerfile.build` which contains the definition of the build container.
3. An optional `Dockerfile` which contains the definition of the runtime container.
4. A script called `build.sh` with permissions `0755` which is used to build:
    1. the build container itself if present,
    2. the application/library inside the build container,
    3. the runtime container if present
5. An optional script called `install.sh` with permissions `0755` which is used to install the result of the built step on the host system if this is desirable (i.e. there is no runtime image).
6. An optional script called `<application>.sh` with permissions `0755` which is used to start the dockerized application from the runtime image.  Typically it will mount host configuration files as volumes inside the image, set up paths and similar.

The build contained should mount the sources as volumes and then be started with `docker run`.  To this end it is necessary to specify a `CMD` directive inside the `Dockerfile.build` recipe.  Usually the steps performed are stored inside `docker-build.sh` which is copied into the image and then executed in the container.

# Examples

* https://github.com/Fuco1/tagsistant-build
* https://github.com/Fuco1/zathura-build
