#!/usr/bin/env bash

docker run --rm -it -v $(pwd):/workdir -p 8080:8080 suchipi/vnc-emulator-thing
