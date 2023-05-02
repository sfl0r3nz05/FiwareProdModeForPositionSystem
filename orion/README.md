# Deploy orion component

A Helm chart for running the fiware orion context broker on kubernetes.

1. Installation

    ```console
    cd ~/FiwareProdModeForPositionSystem/orion
    ```

    ```console
    helm install orion . -n fiware
    ```

2. Once service has been deployed, the *NodePort* type must be enabled:

    ```console
    kubectl edit service orion -n fiware
    ```
