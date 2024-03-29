# How to Deploy

1. Access to `provision` folder once the respository has been cloned:

    ```console
    cd ~/FiwareProdModeForPositionSystem/provision/
    ```

2. Create and copy the certificates using `ssl.sh` script from services names like `mosquitto`, `iotagent-json` , `api` and `mqtt-client-1`. E.g.:

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

5. Remove services, fiware namespace, certificates and restart environmental variables:

    ```console
    ./services stop
    ```