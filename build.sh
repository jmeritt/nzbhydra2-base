#!/bin/bash
docker buildx build --platform linux/amd64 -t jmeritt/nzbhydra2 .
docker push jmeritt/nzbhydra2