FROM alpine:latest AS unzipper
ARG VERSION="2.1.8"
ARG PLATFORM="amd64"

RUN apk add unzip curl
WORKDIR /opt/cse
RUN curl https://cse-bucket.obs.cn-north-1.myhuaweicloud.com/LocalCSE/Local-CSE-$VERSION-linux-$PLATFORM.zip -o /tmp/cse.zip && \
    unzip /tmp/cse.zip && \
    sed -i 's/nohup \${CURRENT_DIR}\/cse > \${log_file} 2>\&1 \&/\${CURRENT_DIR}\/cse > \${log_file} 2>\&1/' start.sh

FROM alpine:latest
RUN apk add bash
WORKDIR /opt/cse
COPY --from=0 /opt/cse /opt/cse

EXPOSE 30100 30103 30110

ENTRYPOINT ["/opt/cse/start.sh"]
