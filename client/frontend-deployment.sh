oc login --token="$OC_TOKEN" --server="$OC_SERVER"
oc project "$PROJECT_NAME"
oc apply -f client/frontend-deployment.yaml   
