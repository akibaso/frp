# 基础镜像
FROM amd64/alpine:3.10
# 作者
LABEL maintainer="AkibaSo"
# # 定义构建参数
ENV FRP_VERSION 0.29.0
# 构建镜像
RUN cd /root \
    &&  wget --no-check-certificate -c https://cdn.zerodream.net/frp/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    &&  tar zxvf frp_${FRP_VERSION}_linux_amd64.tar.gz  \
    &&  cd frp_${FRP_VERSION}_linux_amd64/ \
    &&  cp frpc /usr/bin/ \
    &&  mkdir -p /etc/frp \
    &&  cp frpc.ini /etc/frp \
    &&  cd /root \
    &&  rm frp_${FRP_VERSION}_linux_amd64.tar.gz \
    &&  rm -rf frp_${FRP_VERSION}_linux_amd64/
# 启动时运行
ENTRYPOINT /usr/bin/frpc -c /etc/frp/frpc.ini
