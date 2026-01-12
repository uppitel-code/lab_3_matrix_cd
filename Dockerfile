FROM ubuntu:24.04
 
ENV DEBIAN_FRONTEND=noninteractive
 
RUN apt-get update && apt-get install -y \
    libc6 \
    g++ \
 && rm -rf /var/lib/apt/lists/*
 
COPY deb_pkg/matrix_1.0_amd64.deb /tmp/matrix.deb
RUN dpkg -i /tmp/matrix.deb
 
COPY scripts/run.sh /run.sh
RUN chmod +x /run.sh
 
CMD ["/run.sh"]
