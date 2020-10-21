# probemon-docker
A docker container hosting the python script from https://github.com/klein0r/probemon. 
Inspired by https://github.com/offlinehacker/docker-ap for accessing the wireless network from docker

## Test

```
docker run --rm -it --privileged --net host -e INTERFACE=wlan1 bobiene/probemon
```

## Usage

```
usage: docker run --privileged --net host -e INTERFACE=wlan1 bobiene/probemon [-h] [-i INTERFACE] [-t TIME] [-o OUTPUT] [-b MAX_BYTES]
                   [-c MAX_BACKUPS] [-d DELIMITER] [-f] [-s] [-r] [-D] [-l]
                   [-x MQTT_BROKER] [-u MQTT_USER] [-p MQTT_PASSWORD]
                   [-m MQTT_TOPIC] [-P FILENAME]

a docker image for logging 802.11 probe request frames

optional arguments:
  -h, --help            show this help message and exit
  -t TIME, --time TIME  output time format (unix, iso)
  -b MAX_BYTES, --max-bytes MAX_BYTES
                        maximum log size in bytes before rotating
  -c MAX_BACKUPS, --max-backups MAX_BACKUPS
                        maximum number of log files to keep
  -d DELIMITER, --delimiter DELIMITER
                        output field delimiter
  -f, --mac-info        include MAC address manufacturer
  -s, --ssid            include probe SSID in output
  -r, --rssi            include rssi in output
  -D, --debug           enable debug output
  -l, --log             enable scrolling live view of the logfile
  -P FILENAME, --pid FILENAME
                        save PID to file
  -x MQTT_BROKER, --mqtt-broker MQTT_BROKER
                        mqtt broker server
  -u MQTT_USER, --mqtt-user MQTT_USER
                        mqtt user
  -p MQTT_PASSWORD, --mqtt-password MQTT_PASSWORD
                        mqtt password
  -m MQTT_TOPIC, --mqtt-topic MQTT_TOPIC
                        mqtt topic
```


## Locally Administered Addresses

> A locally administered address is assigned to a device by a network administrator, overriding the burned-in address.

> Universally administered and locally administered addresses are distinguished by setting the second-least-significant bit of the first octet of the address. This bit is also referred to as the U/L bit, short for Universal/Local, which identifies how the address is administered.
(source Wikipedia)

These type of MAC addresses are used by recent various OS/wifi stack to send probe requests anonymously, and using at the same time randomization.

So it defeats tracking and render probemon useless in that case. But not all devices are using this randomization technique, yet.

## Device behavior
It should be noted that not all devices are equal. They vary a lot in behavior regarding of the probe requests (PR). This should be taken into account when analyzing the data collected.

Depending on the type of device (PC/laptop/..., printer, mobile phone/tablet, IoT device), the OS used (Linux, Windows, Android, MacOS/iOS, unknown embedded OS, ...) the wifi chipset and/or the wifi/network stack, one device behave differently from one another when sending probe request.

Even phone using the same OS like android, can behave differently: some send PR every 30 seconds, while others only send PR when the screen is unlocked.

# Legality

I am not a lawyer and I can't give you any advice regarding the law.
But it might not be legal to collect and store probe requests in your country.

Even simply listening to probe requests might not be legal. For example, given the interpretation of *Section 18 U.S. Code § 2511*, it might not be legal to intercept the MAC addresses of devices in a network (?) or in the vicinity (?) in the U.S.A.

In Europe, if you are operating as a business, storing MAC addresses, which are considered private data, might be subject to the *GDPR*.

This is only straching the surface of the legality or illegality of this software.

Use with caution.
