# build-base

Base docker image used for other build images.

The base images are based on various Ubuntu releases, currently we
track `xenial` and `bionic`.  You can find the setup on the respective
`release/` branches.

# *-build conventions

All the build repositories follow the following conventions.

1. The application/library and possibly their dependencies which need to be built from source are attached as git submodules.
2. An optional `Dockerfile.build` which contains the definition of the build container.
3. An optional `Dockerfile` which contains the definition of the runtime container.
4. A script called `build` with permissions `0755` which is used to build:
    1. the build container itself if present,
    2. the application/library inside the build container,
    3. the runtime container if present
5. An optional script called `install` with permissions `0755` which is used to install the result of the built step on the host system if this is desirable (i.e. there is no runtime image).
6. An optional script called `<application>` with permissions `0755` which is used to start the dockerized application from the runtime image.  Typically it will mount host configuration files as volumes inside the image, set up paths and similar.

The build container should mount the sources as volumes and then be
started with `docker run`.  To this end it is necessary to specify a
`CMD` directive inside the `Dockerfile.build` recipe.  Usually the
steps performed are stored inside `docker-build.sh` script which is
copied into the image and then executed in the container.

**Note**: The docker images are only an optional requirement.  If the repository being built uses some other isolation technique, such as `virtualenv`, `stack`, `npm`, `composer` etc. it might just be built on the host directly.

# Examples

* https://github.com/Fuco1/tagsistant-build
* https://github.com/Fuco1/twmn-build
* https://github.com/Fuco1/tmux-build
* https://github.com/Fuco1/zathura-build
* https://github.com/Fuco1/xmobar-build
