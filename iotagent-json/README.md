# Deploy iotagent-ul component

1. Installation

    ```console
    cd ~/FiwareProdModeForPositionSystem/iotagent-json
    ```

    ```console
    helm install iotagent-json . -n fiware
    ```

2. Once service has been deployed, the *NodePort* type must be enabled:

    ```console
    kubectl edit service iotagent-json -n fiware
    ```
