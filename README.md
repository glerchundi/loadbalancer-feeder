# loadbalancer-feeder

Listens to Kubernetes pod events to feed loadbalancer upstreams. It can be configured through environment variables:

* `KUBELISTENER_SELECTOR`: Selector used to filter which pods are used to update the upstreams. 
* `KUBELISTENER_INTERVAL`: Although it's always watching to kube events, it also resync every `KUBELISTENER_INTERVAL` seconds.
* `ETCD_PREFIX`: etcd key prefix.

**Note**: This container follows our [`loadbalancer`](https://github.com/just-containers/nginx-loadbalancer) rules, just be aware that upstream name must coincide with the kubernetes pod or replicationController name. For example:

```
/lb/locations/loc1 = '{"path": "/", "upstream": "podName" }'
/lb/upstreams/podName/...
```

or with replication controller (take into account that a "-" sign appears at the end of the replication controller name, this is the `generateName` used by kubernetes):

```
/lb/locations/loc1 = '{"path": "/", "upstream": "replicationControllerName-" }'
/lb/upstreams/replicationControllerName-/...
```

This working example will help for sure: https://github.com/glerchundi/kubernetes-http-loadbalancer
