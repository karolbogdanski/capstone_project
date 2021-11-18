#!/bin/bash -e

# Bootstrap and join the cluster
/etc/eks/bootstrap.sh ${bootstrap_extra_args} '${cluster_name}'


