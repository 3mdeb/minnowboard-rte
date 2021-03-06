#!/bin/bash

# turn off Minnowboard platform power supply
echo 0 > /sys/class/gpio/gpio199/value

sleep 1

# flash Minnowboard ROM with a new firmware
flashrom -p linux_spi:dev=/dev/spidev1.0,spispeed=32000 -w $1

sleep 1

# turn on Minnowboard platform power supply
echo 1 > /sys/class/gpio/gpio199/value
