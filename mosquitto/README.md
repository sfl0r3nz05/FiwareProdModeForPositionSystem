# Deploy Mosquitto component

1. **Installation**

    ```console
    cd ~/FiwareProdModeForPositionSystem/mosquitto
    ```

    ```console
    helm install mosquitto . -n fiware
    ```

2. **How to test:**

    - See mosquitto pod *logs*. E.g.:

        ```console
        kubectl logs pod/mosquitto-1663427899-5644c9dc56-65hpq -n fiware
        ```

    - Inspect mosquitto *deployment*:

        ```console
        export NODE_IP=$(kubectl get nodes --namespace fiware -o jsonpath="{.items[0].status.addresses[0].address}")
        export NODE_PORT=$(kubectl get --namespace fiware -o jsonpath="{.spec.ports[1].nodePort}" services mosquitto-1663427899)
        echo "URL : amqp://$NODE_IP:$NODE_PORT/"
        ```

   - Deploy subscriber:

        ```console
        docker run -it --rm --name mqtt-subscriber efrecon/mqtt-client sub -h 172.31.29.172 -p 32624 -t "/#"
        ```

    - Deploy publisher:

        ```console
	    docker run -it --rm --name mqtt-publisher efrecon/mqtt-client pub -h 172.31.29.172 -m "SOOntestMessage" -p 32624 -t "/test"
        ```

2. Once service has been deployed, the *NodePort* type must be enabled:

    ```console
    kubectl edit service mosquitto
    ```

## How this helm chart was created

 - git clone https://github.com/halkeye-helm-charts/mosquitto.git
 - Modificar *values.yaml*

    ```console
	service:
	  type: NodePort
    ```
    ```console
	persistence:
	  storageClass: "oci-bv"
    ```

## How to test

- See mosquitto pod *logs*:

    ```console
    kubectl logs pod/mosquitto-1663427899-5644c9dc56-65hpq
    ```

- Inspect mosquitto *deployment*:

    ```console
    export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0]address}")
	export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[1].nodePort}" services mosquitto-1663427899)
	echo "URL : amqp://$NODE_IP:$NODE_PORT/"
    ```

- Deploy subscriber:

    ```console
    docker run -it --rm --name mqtt-subscriber efrecon/mqtt-client sub -h 172.31.29.172 -p 32624 -t "/#"
    ```

- Deploy publisher:

    ```console
    docker run -it --rm --name mqtt-publisher efrecon/mqtt-client pub -h 172.31.29.172 -m "SOOntestMessage" -p 32624 -t "/test"
    ```
