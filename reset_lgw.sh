#!/bin/sh

# This script is intended to be used on IoT Starter Kit platform, it performs
# the following actions:
#       - export/unpexort GPIO4 used to reset the SX1301 chip
#
# Usage examples:
#       ./reset_lgw.sh stop
#       ./reset_lgw.sh start

# The reset pin of SX1301 is wired with RPi GPIO4
# If used on another platform, the GPIO number can be given as parameter.
if [ -z "$2" ]; then 
    IOT_SK_SX1301_RESET_PIN=4
else
    IOT_SK_SX1301_RESET_PIN=$2
fi

#echo "Accessing concentrator reset pin through GPIO$IOT_SK_SX1301_RESET_PIN..."

WAIT_GPIO() {
    sleep 0.1
}

iot_sk_init() {
    # setup GPIO 4
    echo "$IOT_SK_SX1301_RESET_PIN" > /sys/class/gpio/export; WAIT_GPIO

    # set GPIO 4 as output
    echo "out" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/direction; WAIT_GPIO

    # write output for SX1301 reset
    echo "1" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/value; WAIT_GPIO
    echo "0" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/value; WAIT_GPIO

    # set GPIO 4 as input
    echo "in" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/direction; WAIT_GPIO
}

iot_sk_term() {
    # cleanup GPIO 4
    if [ -d /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN ]
    then
        echo "$IOT_SK_SX1301_RESET_PIN" > /sys/class/gpio/unexport; WAIT_GPIO
    fi
}

case "$1" in
    stop)
    iot_sk_term
    ;;
    *)
    iot_sk_term
    iot_sk_init
    ;;
esac

#!/bin/sh

# This script is intended to be used on IoT Starter Kit platform, it performs
# the following actions:
#       - export/unpexort GPIO4 used to reset the SX1301 chip
#
# Usage examples:
#       ./reset_lgw.sh stop
#       ./reset_lgw.sh start

# The reset pin of SX1301 is wired with RPi GPIO4
# If used on another platform, the GPIO number can be given as parameter.
if [ -z "$2" ]; then 
    IOT_SK_SX1301_RESET_PIN=12
else
    IOT_SK_SX1301_RESET_PIN=$2
fi

#echo "Accessing concentrator reset pin through GPIO$IOT_SK_SX1301_RESET_PIN..."

WAIT_GPIO() {
    sleep 0.1
}

iot_sk_init() {
    # setup GPIO 4
    echo "$IOT_SK_SX1301_RESET_PIN" > /sys/class/gpio/export; WAIT_GPIO

    # set GPIO 4 as output
    echo "out" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/direction; WAIT_GPIO

    # write output for SX1301 reset
    echo "1" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/value; WAIT_GPIO
    echo "0" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/value; WAIT_GPIO

    # set GPIO 4 as input
    echo "in" > /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN/direction; WAIT_GPIO
}

iot_sk_term() {
    # cleanup GPIO 4
    if [ -d /sys/class/gpio/gpio$IOT_SK_SX1301_RESET_PIN ]
    then
        echo "$IOT_SK_SX1301_RESET_PIN" > /sys/class/gpio/unexport; WAIT_GPIO
    fi
}

case "$1" in
    stop)
    iot_sk_term
    ;;
    *)
    iot_sk_term
    iot_sk_init
    ;;
esac

