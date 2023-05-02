# Deploy CrateDB component

This directory contains a Kubernetes chart to deploy a [CrateDB](https://crate.io) cluster using a StatefulSet.

## Installing the Chart

To install the chart with the release name `my-release`:

```console
cd ~/FiwareProdModeForPositionSystem/crate
```

```console
helm install crate . -n fiware
```

## Cleanup

To remove the spawned pods you can run a simple `helm delete <release-name>`.

Helm will however preserve created persistent volume claims,
to also remove them execute the commands below.

```console
$ release=<release-name>
$ helm delete $release
$ kubectl delete pvc -l release=$release
```