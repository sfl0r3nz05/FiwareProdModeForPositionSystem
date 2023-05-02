# Deploy Swagger

1. Verify Persistent Volume Claims (PVC) related with swagger no exists

    ```console
    kubectl get pvc -n fiware
    ```

    - Output sample:

    ```console
    NAME             STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
    mongo-db         Bound    mongo-db                                   1Gi        RWO            manual         16m
    swagger-claim0   Bound    pvc-f29f0711-1934-429b-b165-8766f8e2a154   100Mi      RWO            standard       10m
    ```

2. Delete Persistent Volume Claims (PVC).

    ```console
    kubectl delete pvc swagger-claim0 -n fiware
    ```

3. Verify Persistent Volume (PV) related with swagger no exists:

    ```console
    kubectl get pv -n fiware
    ```

    - Output sample:

    ```console
    NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                   STORAGECLASS   REASON   AGE
    mongo-db                                   1Gi        RWO            Retain           Bound    fiware/mongo-db         manual                  6m18s
    pvc-f29f0711-1934-429b-b165-8766f8e2a154   100Mi      RWO            Delete           Bound    fiware/swagger-claim0   standard                13s
    ```

4. Delete Persistent Volume (PV). *The previous output is taken into account*.

    ```console
    kubectl delete pv pvc-f29f0711-1934-429b-b165-8766f8e2a154 -n fiware
    ```

    > Troubleshootings: [How to delete persistent volumes in Kubernetes](https://stackoverflow.com/questions/57401526/how-to-delete-persistent-volumes-in-kubernetes/74039496#74039496)

5. Verify that swagger ConfigMap no exists.

    ```console
    kubectl get configmap -n fiware
    ```

    - Output sample:

    ```console
    NAME               DATA   AGE
    iotagent-json      1      18m
    kube-root-ca.crt   1      37m
    mosquitto          1      26m
    swagger            1      13m
    ```

6. Delete ConfigMap

    ```console
    kubectl delete configmap swagger -n fiware
    ```

7. If the Cluster deployed is a *Test Cluster*.

    > **Note:** If the Cluster deployed is a K8s Cluster not jump to *step 8*.

   1. Expose `api-crate` and `api-orion` services as `NodePort`.

        ```console
        kubectl edit service api-crate -n fiware
        ```

        ```console
        kubectl edit service api-orion -n fiware
        ```

       - Change the *ClusterIP* service type to *NodePort* by editing the field shown in the figure for both `api-crate` and `api-orion`:

        ![img](../documentation/image/clusterip-to-nodeport.png)

   2. Recover host:

        ```console
        export API_CRATE_HOST=$(hostname -i)
        ```

        ```console
        export API_ORION_HOST=$(hostname -i)
        ```

   3. Recover port:

        ```console
        export API_CRATE_PORT=$(kubectl -n fiware get svc api-crate -o jsonpath='{...nodePort}')
        ```

        ```console
        export API_ORION_PORT=$(kubectl -n fiware get svc api-orion -o jsonpath='{...nodePort}')
        ```

   4. Collect IP HOST:

        ```console
        export API_CRATE_EXPORTED=$API_CRATE_HOST:$API_CRATE_PORT
        ```

        ```console
        export API_ORION_EXPORTED=$API_ORION_HOST:$API_ORION_PORT
        ```

   5. Echo API_CRATE_EXPORTED:

        ```console
        echo $API_CRATE_EXPORTED
        ```

        ```console
        echo $API_ORION_EXPORTED
        ```

   6. Edit `~/swagger/config-json.yaml` file.
   7. Edit the servers array:
      1. Modify the line `"url": "api-crate:8080",` by the content of the variable `API_CRATE_EXPORTED`. E.g.: `172.31.85.246:30047`.
      2. Modify the line `"url": "api-orion:8080",` by the content of the variable `API_ORION_EXPORTED`. E.g.: `172.31.85.246:30057`.
      3. Sample of the output:

        ```console
        "servers": [
          {
            "url": "http://172.31.85.246:32559"
          },
          {
            "url": "http://172.31.85.246:31088"
          }
        ]
        ```

8. Go into `Swagger` directory

    ```console
    cd ~/FiwareK8sProdMode/swagger
    ```

9. Execute deployments and services

    ```console
    kubectl create -f . -n fiware
    ```
