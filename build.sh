#!/bin/bash
docker buildx build --platform linux/amd64 -t jmeritt/nzbhydra2 . && docker push jmeritt/nzbhydra2 && kubectl rollout restart deployment nzbhydra2