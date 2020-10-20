FROM alpine

#RUN apt-get update && \
#    apt-get -y install wireless-tools usbutils 

ENV INTERFACE=wlan0

RUN apk add --no-cache bash hostapd iw wireless-tools gawk python3 && \
        ln -sf python3 /usr/bin/python && \
        python3 -m ensurepip && \
        pip3 install --no-cache --upgrade pip setuptools && \
        pip3 install paho-mqtt netaddr scapy

ADD wlanstart.sh /bin/wlanstart.sh
ADD probemon.py /bin/probemon.py
RUN /bin/chmod +x /bin/wlanstart.sh
# USER root
ENTRYPOINT ["/bin/wlanstart.sh"]