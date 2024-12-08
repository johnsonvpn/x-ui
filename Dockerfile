FROM golang:latest AS builder
WORKDIR /root
COPY . .
RUN go build main.go


FROM debian:11-slim
RUN apt-get update && apt-get install -y --no-install-recommends -y ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /root
COPY --from=builder  /root/main /root/x-ui
COPY bin/. /root/bin/.
VOLUME [ "/etc/x-ui" ]
CMD [ "./x-ui" ]
# 使用社区提供的 X-UI 镜像
FROM enwaiax/x-ui:latest

# 暴露默认端口 54321
EXPOSE 54321
