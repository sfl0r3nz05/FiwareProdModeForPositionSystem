# Deployed components provisioning

1. Go into provision folder:

    ```console
    cd ~/FiwareProdModeForPositionSystem/provision/
    ```

2. Pull docker images

    ```console
    ./services create
    ```

3. Once service has been deployed, the NodePort type must be enabled to provision `entities`, `devices`, `services` and `subscriptions`:

    - iotagent-json:

        ```console
        kubectl edit service iotagent-json -n fiware
        ```

        - Inspect iotagent-json *deployment*:

            ```console
            export NODE_IP=$(kubectl get nodes --namespace fiware -o jsonpath="{.items[0].status.addresses[0].address}")
            ```

            ```console
            export NODE_PORT=$(kubectl get --namespace fiware -o jsonpath="{.spec.ports[0].nodePort}" services iotagent-json)
            ```

            ```console
            echo "URL : http://$NODE_IP:$NODE_PORT/"
            ```

        - Update environmental variables:

            ```console
            # IoT Agent Ultralight Variables
            IOTA_JSON_NORTH_PORT=4041
            IOTA_JSON_HOST=172.31.85.246
            ```

    - orion:

        ```console
        kubectl edit service orion -n fiware
        ```

        - Inspect orion *deployment*:

            ```console
            export NODE_IP=$(kubectl get nodes --namespace fiware -o jsonpath="{.items[0].status.addresses[0].address}")
            ```

            ```console
            export NODE_PORT=$(kubectl get --namespace fiware -o jsonpath="{.spec.ports[0].nodePort}" services orion)
            ```

            ```console
            echo "URL : http://$NODE_IP:$NODE_PORT/"
            ```

        - Update environmental variables:

            ```console
            # Orion variables
            ORION_PORT=1026
            ORION_HOST=172.31.85.246
            ```

    - quantumleap:

        ```console
        kubectl edit service quantumleap -n fiware
        ```

        - Inspect quantumleap *deployment*:

            ```console
            export NODE_IP=$(kubectl get nodes --namespace fiware -o jsonpath="{.items[0].status.addresses[0].address}")
            ```

            ```console
            export NODE_PORT=$(kubectl get --namespace fiware -o jsonpath="{.spec.ports[0].nodePort}" services quantumleap)
            ```

            ```console
            echo "URL : http://$NODE_IP:$NODE_PORT/"
            ```

        - Update environmental variables:

            ```console
            # QuantumLeap Variables
            QUANTUMLEAP_PORT=8668
            QUANTUMLEAP_HOST=172.31.85.246
            ```

4. Copy the MongoDB pod name. E.g.:

    ```console

    ```

    - Update environmental variables:
    
        ```console
        MOMGO_POD_NAME=
        ```

5. Deploy containers, add database indexes, create entities, device provisioning and create subscriptions.

    ```console
    ./services provision
    ```
