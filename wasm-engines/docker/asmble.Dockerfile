
ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN apt-get install -y openjdk-8-jre

# install asmble
RUN wget https://github.com/cdetrio/asmble/releases/download/0.4.2-fl-bench-times/asmble-0.4.2-fl-bench-times.tar
RUN tar -xvf asmble-0.4.2-fl-bench-times.tar
