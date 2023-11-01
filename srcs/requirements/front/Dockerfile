FROM debian:bookworm

RUN apt update -y \
 && apt upgrade -y

RUN apt-get update \
 && apt-get install -y ca-certificates curl gnupg \
 && mkdir -p /etc/apt/keyrings \
 && apt -y install curl \
 && apt-get -y install procps

RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

RUN export NODE_MAJOR=16 \
 && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update \
 && apt-get install nodejs -y

COPY setup.sh setup.sh


ENTRYPOINT ["bash", "setup.sh"]

CMD [ "/bin/bash" ] 
