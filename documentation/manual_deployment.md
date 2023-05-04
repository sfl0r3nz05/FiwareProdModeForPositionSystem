# Manual deployment of the components

   ![Architecture](./images/ArchitectureK8s.png)

## Fiware Environment

   1. Create the fiware namespace:
   
       ```console
       kubectl create namespace fiware
       ```
   
   2. Deploy all components in following order:
   
       - [mosquitto](../mosquitto/README.md)
       - [mongodb](../mongo/README.md)
       - [iotagent-json](../iotagent-json/README.md)
       - [orion](../orion/README.md)
       - [quantumleap](../quantumleap/README.md)
       - [crate](../crate/README.md)
       - [api-cratedb](../api-cratedb/README.md)
       - [nginx](../nginx/README.md)
       - [swagger](../swagger/README.md)

## Agent Simulator

   1. Update submodules:

       ```console
       git submodule update --init --recursive
       ```

   2. Update the `PROTOCOL` environmental variable from `AMQP` to `MQTT`:

       ```console
       cd ./Publisher-Agent
       nano docker-compose.yml
       PROTOCOL=MQTT
       ```

   3. Update the `MQTT_QUEUE_HOST` environmental variable for `MQTT` broker address. E.g.:

       ```console
       cd ./Publisher-Agent
       nano docker-compose.yml
       MQTT_QUEUE_HOST=10.63.27.49
       ```

   4. Update the `MQTT_QUEUE_PORT` environmental variable for `MQTT` broker port. E.g.:

       ```console
       cd ./Publisher-Agent
       nano docker-compose.yml
       MQTT_QUEUE_PORT=31257
       ```
