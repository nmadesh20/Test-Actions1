#!/bin/bash
LATEST_COMMIT=$(git diff --name-only HEAD~1..HEAD)
CLUSTER_COMMIT=$(git diff --name-only HEAD~1..HEAD | awk -F '/' '{print $2}')
for cluster in $CLUSTER_COMMIT;do
echo $cluster >> updatedclusters;
done
clusterDetails(){
    

for cluster in $(cat updatedclusters);do
RG=$(az resource list --name $cluster --resource-type "Micosoft.ContainerService/managedClusters" --query '[].resourceGroup' --output tsv)
if [[ ! -z $RG ]];then
az aks get-credentials -n $cluster -g $RG 2>&1
if [[ $? != 0 ]];then
echo -e "Not Connected"
fi
else
echo "RG and $cluster not found" >&2
continue
fi
done

}

ClusterCheck(){
    clusterDetails
  for app in $(git diff --name-only HEAD~1..HEAD | grep $cluster | cut -d '/' -f 2-4);do
  echo $cluster
  echo $app
  done
}

err_report() {
  echo "errexit on line $(caller)" >&2
}

trap err_report ERR



ClusterCheck
rm updatedclusters