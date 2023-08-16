# Container image that runs your code
FROM alpine:3.10

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY secret-regex $GITHUB_WORKSPACE/secret-regex
COPY entrypoint.sh $GITHUB_WORKSPACE/entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["$GITHUB_WORKSPACE/entrypoint.sh"]