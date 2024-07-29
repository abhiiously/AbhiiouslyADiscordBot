FROM node:18

WORKDIR /config

RUN apt-get update && apt-get install -y git

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]