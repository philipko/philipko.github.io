MQTT Note
=======


Commands
----------

```
mosquitto_sub -v -h localhost -p 1883 -t sensors/#

mosquitto_pub -h localhost -p 1883 -t sensors/temperature -m 32 -q 1

#retain message
mosquitto_pub -h localhost -p 1883 -t sensors/123 -m 42 -q 1 -r

```
