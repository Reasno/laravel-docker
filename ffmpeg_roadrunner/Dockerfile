FROM registry.cn-qingdao.aliyuncs.com/huiji/laravel-production:2.6
# Install GRPC roadrunner
ENV RR_VERSION 1.0.1
RUN curl -sL https://github.com/spiral/php-grpc/releases/download/v${RR_VERSION}/rr-grpc-${RR_VERSION}-linux-amd64.tar.gz -o rr-grpc.tar.gz\
    && tar -xzf rr-grpc.tar.gz \
    && mv rr-grpc-${RR_VERSION}-linux-amd64/rr-grpc /usr/local/bin/rr-grpc \
    && rm rr-grpc.tar.gz
# Install dependencies
WORKDIR /var/www/html
COPY install_ffmpeg.sh install_ffmpeg.sh
RUN chmod +x ./install_ffmpeg.sh && ./install_ffmpeg.sh