FROM jmeritt/ubuntu-htpc

RUN apt-get update &&\
	apt-get install -y openjdk-11-jdk unzip

USER htpc
ENV VER=4.4.0

RUN mkdir ~/nzbhydra2 && \
cd ~/nzbhydra2 && \
wget "https://github.com/theotherp/nzbhydra2/releases/download/v${VER}/nzbhydra2-${VER}-linux.zip" && \
unzip "nzbhydra2-${VER}-linux.zip" && \
rm "nzbhydra2-${VER}-linux.zip" && \
chmod u+x nzbhydra2

EXPOSE 5076
VOLUME /data

ENV PATH="/home/htpc/nzbhydra2:${PATH}"

CMD nzbhydra2 --nobrowser --datafolder /data


