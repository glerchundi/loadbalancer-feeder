# loadbalancer-feeder

Listens to Kubernetes pod events to feed loadbalancer (using our [`loadbalancer`](https://github.com/just-containers/nginx-loadbalancer) rules) upstreams. It can be configured through environment variables:

* `KUBELISTENER_SELECTOR`: Selector used to filter which pods are used to update the upstreams. 
* `KUBELISTENER_INTERVAL`: Although it's always watching to kube events, it also resync every `KUBELISTENER_INTERVAL` seconds.
* `ETCD_PREFIX`: etcd key prefix.

Take a look to: https://github.com/glerchundi/kubernetes-http-loadbalancer
