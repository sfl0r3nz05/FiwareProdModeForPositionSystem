# How to Deploy

1. Access to `provision` folder once the respository has been cloned:

    ```console
    cd ~/FiwareProdModeForPositionSystem/provision/
    ```

2. Create and copy the certificates using `ssl.sh` script from services names like `mosquitto`, `iotagent-json` , `api` and `mqtt-client-1`. E.g.:

    > Details of the script have been documented in [Security Layer](./SecurityAdded.md)

    ```console
    ./ssl.sh api
    ```

3. Provision entities, device and services as well as create subscriptions:

    ```console
    ./services create
    ```

4. Provision entities, device and services as well as create subscriptions:

    ```console
    ./services start
    ```

5. Accept the risk when self signed certificates are used:

6. Short demonstration using `Swagger`:

7. Remove services, fiware namespace, certificates and restart environmental variables:

    ```console
    ./services stop
    ```