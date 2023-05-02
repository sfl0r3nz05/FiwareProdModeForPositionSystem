# Manual deployment of the components

1. Create the fiware namespace:

    ```console
    kubectl create namespace fiware
    ```

2. Deploy all components in following order:

    - [mosquitto](../mosquitto/README.md)
    - [mongodb](../mongo/README.md)