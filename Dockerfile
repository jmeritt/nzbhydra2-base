FROM jmeritt/debian-htpc

RUN apt-get update &&\
	apt-get install -y openjdk-11-jdk unzip

USER htpc

RUN mkdir ~/nzbhydra2 && \
cd ~/nzbhydra2 && \
wget https://github.com/theotherp/nzbhydra2/releases/download/v2.7.2/nzbhydra2-2.7.2-linux.zip && \
unzip nzbhydra2-2.7.2-linux.zip && \
rm nzbhydra2-2.7.2-linux.zip && \
chmod u+x nzbhydra2

EXPOSE 5076
VOLUME /data

ENV PATH="/home/htpc/nzbhydra2:${PATH}"

#-Dcom.sun.xml.bind.v2.bytecode.ClassTailor.noOptimize=true
CMD nzbhydra2 --nobrowser --datafolder /data


