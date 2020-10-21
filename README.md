# probemon-docker
A docker container hosting the python script from https://github.com/klein0r/probemon. 
Inspired by https://github.com/offlinehacker/docker-ap for accessing the wireless network from docker



## Test

```
docker run --rm -it --privileged --net host -e INTERFACE=wlan1 bobiene/probemon
```
