# create a service principal

az ad sp create-for-rbac --name ansible \
            --role Contributor \
            --scopes /subscriptions/ab1c6053-fb6f-4ad2-8910-305638356165

# {
#   "appId": "41e073af-6eac-4bf8-96b8-83d97f264bd6",
#   "displayName": "ansible",
#   "password": "UB.8Q~7Rj1lGPoQ3jti8ATkaY.muuVFhiQ5RPca-",
#   "tenant": "cf5bcce4-b29c-4270-abd3-c4a0a9005c45"
# }

az role assignment create --assignee 41e073af-6eac-4bf8-96b8-83d97f264bd6 \
    --role Contributor \
    --scope /subscriptions/ab1c6053-fb6f-4ad2-8910-305638356165

# {
#   "canDelegate": null,
#   "condition": null,
#   "conditionVersion": null,
#   "description": null,
#   "id": "/subscriptions/ab1c6053-fb6f-4ad2-8910-305638356165/providers/Microsoft.Authorization/roleAssignments/ff1bba7c-dbc0-4a23-8c9a-498486ff4171",
#   "name": "ff1bba7c-dbc0-4a23-8c9a-498486ff4171",
#   "principalId": "288756e1-8b47-4b41-89b1-85dd1d68eb20",
#   "principalName": "41e073af-6eac-4bf8-96b8-83d97f264bd6",
#   "principalType": "ServicePrincipal",
#   "roleDefinitionId": "/subscriptions/ab1c6053-fb6f-4ad2-8910-305638356165/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c",
#   "roleDefinitionName": "Contributor",
#   "scope": "/subscriptions/ab1c6053-fb6f-4ad2-8910-305638356165",
#   "type": "Microsoft.Authorization/roleAssignments"
# }


az account show --query '{tenantId:tenantId,subscriptionid:id}';

# {
#   "subscriptionid": "ab1c6053-fb6f-4ad2-8910-305638356165",
#   "tenantId": "cf5bcce4-b29c-4270-abd3-c4a0a9005c45"
# }

az ad sp list --display-name ansible --query '{clientId:[0].appId}'

# {
#   "clientId": "41e073af-6eac-4bf8-96b8-83d97f264bd6"
# }


 curl -L https://istio.io/downloadIstio | sh -

 cd istio-1.17.1