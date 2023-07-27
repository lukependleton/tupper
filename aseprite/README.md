This container is used to build the aseprite pixel art program from source.

Compiling Aseprite from source requires some custom dependencies, so I wanted to containerize it to make things easier


## Pulling the Aseprite source code from github
Download and unzip the release with:
```bash
# With gh
# curl -L $(gh api repos/aseprite/aseprite/releases/latest -q=.tarball_url) | tar -xzf - -C src
# Without gh
# curl -L $(curl -L https://api.github.com/repos/aseprite/aseprite/releases/latest | jq -r .tarball_url) | tar -xzf - -C src
# curl -L $(curl -L https://api.github.com/repos/aseprite/aseprite/releases/latest | jq -r '.assets[] | select(.name | match(".zip")).browser_download_url') | unzip -d src
# The tar.gz files don't contian the submodules - have to use the zip file
wget $(curl -L https://api.github.com/repos/aseprite/aseprite/releases/latest | jq -r '.assets[] | select(.name | match(".zip")).browser_download_url') -O aseprite.zip && unzip aseprite.zip -d src/aseprite && rm aseprite.zip
```

Download and unzip the aseprite version of skia used by laf, which is used to compile the overall application
```
curl -L $(curl -L https://api.github.com/repos/aseprite/skia/releases/latest | jq -r .tarball_url) | tar -xzf - -C src

 Skia-Linux-Release-x64-libc++.zip 

wget "https://github.com/aseprite/skia/releases/download/m102-861e4743af/Skia-Linux-Release-x64-libc++.zip" -O skia.zip && unzip skia.zip -d src/aseprite-skia && rm skia.zip
```

## Building the countainer
```
docker build -t build-aseprite .
```

## Running the container to build aseprite
Mount the local `src/aseprite-aseprite-<commit-hash>` directory to the `/home/bobthebuilder/aseprite` path in the container
Mount the local `src/aseprite-skia-861e474` directory to the `$HOME/deps/skia` or in this case the `/home/bobthebuilder/deps/skia` path
```bash
docker run -
# Debugging
docker run --rm -v $(pwd)/src/aseprite-aseprite-637d71a:/home/bobthebuilder/aseprite -v $(pwd)/src/aseprite-skia-861e474:/home/bobthebuilder/deps/skia -it --entrypoint /bin/bash build-aseprite

# Change aseprite unzipping...
docker run --rm -v $(pwd)/src/aseprite:/home/bobthebuilder/aseprite -v $(pwd)/src/aseprite-skia-861e474:/home/bobthebuilder/deps/skia -it --entrypoint /bin/bash build-aseprite
```
