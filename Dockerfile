FROM golang:latest AS builder




FROM debian:11-slim

COPY --from=builder  /root/main /root/x-ui
COPY bin/. /root/bin/.
CMD [ "./x-ui" ]
# 使用社区提供的 X-UI 镜像
FROM enwaiax/x-ui:latest

# 暴露默认端口 54321
EXPOSE 54321
EXPOSE 37439
