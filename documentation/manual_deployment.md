# Manual deployment of the components

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