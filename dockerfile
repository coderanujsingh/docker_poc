FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    telnet \
    openjdk-8-jre \
    -qqy x11-apps
ENV DISPLAY :0
ENV RESOLUTION 1366x768x24 
ADD apache-jmeter-5.1.1.tgz /home
CMD `sed -i -e '/^assistive_technologies=/s/^/#/' /etc/java-*-openjdk/accessibility.properties`
#CMD exec /bin/bash -c "top"
CMD exec /bin/bash -c "trap : TERM INT;sleep infinity & wait"
