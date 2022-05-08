# tf_gitlab_k8
Kubernetes deployment with gitlab integration using terraform.  for more details see the blog associated to this repos here: https://adampeterjones.github.io/blog/2022/05/06/terraform-kubernetes-git

## contents
- config 
contains the environment initialisation settings and variables

- terraform 
contains the base specification to build:
    - gitlab token creation
    - data to connect dynamically to the kubernetes cluster
    - create a kubernetes secret which is in the form of dockerconfigjson using the gitlab token created above
    - create a deployment manifest 
        - uses the map to determine the quantity of deployments to create (0 or more)
        - builds the name and image based on the variables in the environment settings


## Dependencies
assumes you have:
- a deploy token (set at the appropriate gitlab project level which has the ability to read and write via the gitlab api)
- already created an eks cluster (probably via terraform)
- have created the namespace (in this repos we use one called workflow )
- gitlab-ci.yaml - this assumes that the deployment will be run from an eks cluster in the cloud account and this will do the following
    - set the GITLAB_TOKEN environment variable to the deploy token value (set this as a ci/cd variable in the project settings)
    - pass in the resource management role used to deploy the infrastructure in the environment (set this as a ci/cd variable in the project settings)
    - pass in the external_id of the role above to secure the sts assume role (set this as a ci/cd variable in the project settings)
