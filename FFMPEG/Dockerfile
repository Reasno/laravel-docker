FROM reasno/laravel-docker:latest
# Install GRPC roadrunner
ENV RR_VERSION 1.0.8
RUN curl -sL https://github.com/spiral/php-grpc/releases/download/v${RR_VERSION}/rr-grpc-${RR_VERSION}-linux-amd64.tar.gz -o rr-grpc.tar.gz\
    && tar -xzf rr-grpc.tar.gz \
    && mv rr-grpc-${RR_VERSION}-linux-amd64/rr-grpc /usr/local/bin/rr-grpc \
    && rm rr-grpc.tar.gz
RUN apt-get update && apt-get -y install ffmpeg
