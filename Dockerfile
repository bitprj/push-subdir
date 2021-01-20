FROM node:12-slim

LABEL repository="https://github.com/emsesc/push-subdir"
LABEL homepage="https://github.com/bitprj/push-subdir"
LABEL maintainer="Daniel Kim <daniel@bitproject.org>"

LABEL com.github.actions.name="GitHub Action to Push Subdirectories to Another Repo"
LABEL com.github.actions.description="Automatically push subdirectories in a monorepo to their own repositories"
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="purple"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y jq

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
