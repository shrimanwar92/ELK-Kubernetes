# ELK for application log analytics


To implement application log analysis using Elasticsearch and filebeat using Kubernetes. 

Created deployments for application Pods. Statefulset for ES cluster.

Daemonsets for filebeat running on each node to tail app logs stored in /tmp/logs folder.

Achieved log persistance by using Persistent volumes, Persistent volume claims and Storage class.

Used Config maps and Secrets to pass configuration to Pods by volume mounts.

To run,

`chmod +x ./deploy.sh`
`./deploy.sh apply`

To delete

`./deploy.sh delete`
