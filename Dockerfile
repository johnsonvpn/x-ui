FROM golang:latest AS builder
WORKDIR /root
COPY . .



FROM debian:11-slim
WORKDIR /root
COPY --from=builder  /root/main /root/x-ui
COPY bin/. /root/bin/.
VOLUME [ "/etc/x-ui" ]
CMD [ "./x-ui" ]
# 使用社区提供的 X-UI 镜像
FROM enwaiax/x-ui:latest

# 暴露默认端口 54321
EXPOSE 54321
