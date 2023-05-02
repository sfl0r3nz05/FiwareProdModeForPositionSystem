# Deploy Mosquitto component

1. **Installation**

    ```console
    cd ~/FiwareProdModeForPositionSystem/mosquitto
    ```

    ```console
    helm install mosquitto . -n fiware
    ```

2. Once service has been deployed, the *NodePort* type must be enabled to use mosquitto as *entrypoint*:

    ```console
    kubectl edit service mosquitto -n fiware
    ```

3. How to test:

    - See mosquitto pod *logs*. E.g.:

        ```console
        kubectl logs pod/mosquitto-1663427899-5644c9dc56-65hpq -n fiware
        ```

    - Inspect mosquitto *deployment*:

        ```console
        export NODE_IP=$(kubectl get nodes --namespace fiware -o jsonpath="{.items[0].status.addresses[0].address}")
        ```

        ```console
        export NODE_PORT=$(kubectl get --namespace fiware -o jsonpath="{.spec.ports[0].nodePort}" services mosquitto)
        ```

        ```console
        echo "URL : mqtt://$NODE_IP:$NODE_PORT/"
        ```

   - Deploy subscriber. E.g.:

        ```console
        docker run -it --rm --name mqtt-subscriber efrecon/mqtt-client sub -h 10.63.27.39 -p 32553 -t "/#"
        ```

    - Deploy publisher:

        ```console
	    docker run -it --rm --name mqtt-publisher efrecon/mqtt-client pub -h 10.63.27.39 -m "SOOntestMessage" -p 32553 -t "/test"
        ```
