# Empress API Specification Bash client

## Overview

This is a Bash client script for accessing Dynamic API Specification service.

The script uses cURL underneath for making all REST calls.

## Usage

```shell
# Make sure the script has executable rights
$ chmod u+x 

# Print the list of operations available on the service
$ ./ -h

# Print the service description
$ ./ --about

# Print detailed information about specific operation
$ ./ <operationId> -h

# Make GET request
./ --host http://<hostname>:<port> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make GET request using arbitrary curl options (must be passed before <operationId>) to an SSL service using username:password
 -k -sS --tlsv1.2 --host https://<hostname> -u <user>:<password> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make POST request
$ echo '<body_content>' |  --host <hostname> --content-type json <operationId> -

# Make POST request with simple JSON content, e.g.:
# {
#   "key1": "value1",
#   "key2": "value2",
#   "key3": 23
# }
$ echo '<body_content>' |  --host <hostname> --content-type json <operationId> key1==value1 key2=value2 key3:=23 -

# Make POST request with form data
$  --host <hostname> <operationId> key1:=value1 key2:=value2 key3:=23

# Preview the cURL command without actually executing it
$  --host http://<hostname>:<port> --dry-run <operationid>

```

## Docker image

You can easily create a Docker image containing a preconfigured environment
for using the REST Bash client including working autocompletion and short
welcome message with basic instructions, using the generated Dockerfile:

```shell
docker build -t my-rest-client .
docker run -it my-rest-client
```

By default you will be logged into a Zsh environment which has much more
advanced auto completion, but you can switch to Bash, where basic autocompletion
is also available.

## Shell completion

### Bash

The generated bash-completion script can be either directly loaded to the current Bash session using:

```shell
source .bash-completion
```

Alternatively, the script can be copied to the `/etc/bash-completion.d` (or on OSX with Homebrew to `/usr/local/etc/bash-completion.d`):

```shell
sudo cp .bash-completion /etc/bash-completion.d/
```

#### OS X

On OSX you might need to install bash-completion using Homebrew:

```shell
brew install bash-completion
```

and add the following to the `~/.bashrc`:

```shell
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

### Zsh

In Zsh, the generated `_` Zsh completion file must be copied to one of the folders under `$FPATH` variable.

## Documentation for API Endpoints

All URIs are relative to **

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*ActivityApi* | [**createComment**](docs/ActivityApi.md#createcomment) | **POST** /activity/comment | Create a Comment
*ActivityApi* | [**getActivities**](docs/ActivityApi.md#getactivities) | **GET** /activity | List Activity Actions
*ActivityApi* | [**getActivity**](docs/ActivityApi.md#getactivity) | **GET** /activity/{id} | Retrieve an Activity Action
*AssetsApi* | [**getAsset**](docs/AssetsApi.md#getasset) | **GET** /assets/{id} | Get an Asset
*AuthenticationApi* | [**login**](docs/AuthenticationApi.md#login) | **POST** /auth/login | Retrieve a Temporary Access Token
*AuthenticationApi* | [**logout**](docs/AuthenticationApi.md#logout) | **POST** /auth/logout | Log Out
*AuthenticationApi* | [**oauth**](docs/AuthenticationApi.md#oauth) | **GET** /auth/oauth | List OAuth Providers
*AuthenticationApi* | [**oauthProvider**](docs/AuthenticationApi.md#oauthprovider) | **GET** /auth/oauth/{provider} | Authenticated using an OAuth provider
*AuthenticationApi* | [**passwordRequest**](docs/AuthenticationApi.md#passwordrequest) | **POST** /auth/password/request | Request a Password Reset
*AuthenticationApi* | [**passwordReset**](docs/AuthenticationApi.md#passwordreset) | **POST** /auth/password/reset | Reset a Password
*AuthenticationApi* | [**refresh**](docs/AuthenticationApi.md#refresh) | **POST** /auth/refresh | Refresh Token
*CollectionsApi* | [**getCollection**](docs/CollectionsApi.md#getcollection) | **GET** /collections/{id} | Retrieve a Collection
*CollectionsApi* | [**getCollections**](docs/CollectionsApi.md#getcollections) | **GET** /collections | List Collections
*ExtensionsApi* | [**getDisplays**](docs/ExtensionsApi.md#getdisplays) | **GET** /extensions/displays | List Displays
*ExtensionsApi* | [**getInterfaces**](docs/ExtensionsApi.md#getinterfaces) | **GET** /extensions/interfaces | List Interfaces
*ExtensionsApi* | [**getLayouts**](docs/ExtensionsApi.md#getlayouts) | **GET** /extensions/layouts | List Layouts
*ExtensionsApi* | [**getModules**](docs/ExtensionsApi.md#getmodules) | **GET** /extensions/modules | List Modules
*FieldsApi* | [**getCollectionField**](docs/FieldsApi.md#getcollectionfield) | **GET** /fields/{collection}/{id} | Retrieve a Field
*FieldsApi* | [**getCollectionFields**](docs/FieldsApi.md#getcollectionfields) | **GET** /fields/{collection} | List Fields in Collection
*FieldsApi* | [**getFields**](docs/FieldsApi.md#getfields) | **GET** /fields | List All Fields
*FilesApi* | [**createFile**](docs/FilesApi.md#createfile) | **POST** /files | Create a File
*FilesApi* | [**deleteFile**](docs/FilesApi.md#deletefile) | **DELETE** /files/{id} | Delete a File
*FilesApi* | [**deleteFiles**](docs/FilesApi.md#deletefiles) | **DELETE** /files | Delete Multiple Files
*FilesApi* | [**getFile**](docs/FilesApi.md#getfile) | **GET** /files/{id} | Retrieve a Files
*FilesApi* | [**getFiles**](docs/FilesApi.md#getfiles) | **GET** /files | List Files
*FilesApi* | [**updateFile**](docs/FilesApi.md#updatefile) | **PATCH** /files/{id} | Update a File
*FilesApi* | [**updateFiles**](docs/FilesApi.md#updatefiles) | **PATCH** /files | Update Multiple Files
*FlowsApi* | [**getFlow**](docs/FlowsApi.md#getflow) | **GET** /flows/{id} | Retrieve a Flow
*FlowsApi* | [**getFlows**](docs/FlowsApi.md#getflows) | **GET** /flows | List Flows
*FoldersApi* | [**createFolder**](docs/FoldersApi.md#createfolder) | **POST** /folders | Create a Folder
*FoldersApi* | [**deleteFolder**](docs/FoldersApi.md#deletefolder) | **DELETE** /folders/{id} | Delete a Folder
*FoldersApi* | [**deleteFolders**](docs/FoldersApi.md#deletefolders) | **DELETE** /folders | Delete Multiple Folders
*FoldersApi* | [**getFolder**](docs/FoldersApi.md#getfolder) | **GET** /folders/{id} | Retrieve a Folder
*FoldersApi* | [**getFolders**](docs/FoldersApi.md#getfolders) | **GET** /folders | List Folders
*FoldersApi* | [**updateFolder**](docs/FoldersApi.md#updatefolder) | **PATCH** /folders/{id} | Update a Folder
*FoldersApi* | [**updateFolders**](docs/FoldersApi.md#updatefolders) | **PATCH** /folders | Update Multiple Folders
*ItemsApi* | [**createItemsAccounts**](docs/ItemsApi.md#createitemsaccounts) | **POST** /items/accounts | Create an Item
*ItemsApi* | [**createItemsAppointments**](docs/ItemsApi.md#createitemsappointments) | **POST** /items/appointments | Create an Item
*ItemsApi* | [**createItemsBudgets**](docs/ItemsApi.md#createitemsbudgets) | **POST** /items/budgets | Create an Item
*ItemsApi* | [**createItemsCampaigns**](docs/ItemsApi.md#createitemscampaigns) | **POST** /items/campaigns | Create an Item
*ItemsApi* | [**createItemsCarbonFootprint**](docs/ItemsApi.md#createitemscarbonfootprint) | **POST** /items/carbon_footprint | Create an Item
*ItemsApi* | [**createItemsCompanyAssets**](docs/ItemsApi.md#createitemscompanyassets) | **POST** /items/company_assets | Create an Item
*ItemsApi* | [**createItemsContent**](docs/ItemsApi.md#createitemscontent) | **POST** /items/content | Create an Item
*ItemsApi* | [**createItemsContracts**](docs/ItemsApi.md#createitemscontracts) | **POST** /items/contracts | Create an Item
*ItemsApi* | [**createItemsCrm**](docs/ItemsApi.md#createitemscrm) | **POST** /items/crm | Create an Item
*ItemsApi* | [**createItemsDepartment**](docs/ItemsApi.md#createitemsdepartment) | **POST** /items/department | Create an Item
*ItemsApi* | [**createItemsDistribution**](docs/ItemsApi.md#createitemsdistribution) | **POST** /items/distribution | Create an Item
*ItemsApi* | [**createItemsEmailCampaigns**](docs/ItemsApi.md#createitemsemailcampaigns) | **POST** /items/email_campaigns | Create an Item
*ItemsApi* | [**createItemsEmployeeDirectory**](docs/ItemsApi.md#createitemsemployeedirectory) | **POST** /items/employee_directory | Create an Item
*ItemsApi* | [**createItemsEnergyEfficiency**](docs/ItemsApi.md#createitemsenergyefficiency) | **POST** /items/energy_efficiency | Create an Item
*ItemsApi* | [**createItemsEnvironmentalCompliance**](docs/ItemsApi.md#createitemsenvironmentalcompliance) | **POST** /items/environmental_compliance | Create an Item
*ItemsApi* | [**createItemsEvents**](docs/ItemsApi.md#createitemsevents) | **POST** /items/events | Create an Item
*ItemsApi* | [**createItemsExpenses**](docs/ItemsApi.md#createitemsexpenses) | **POST** /items/expenses | Create an Item
*ItemsApi* | [**createItemsFacilities**](docs/ItemsApi.md#createitemsfacilities) | **POST** /items/facilities | Create an Item
*ItemsApi* | [**createItemsFeedback**](docs/ItemsApi.md#createitemsfeedback) | **POST** /items/feedback | Create an Item
*ItemsApi* | [**createItemsForum**](docs/ItemsApi.md#createitemsforum) | **POST** /items/forum | Create an Item
*ItemsApi* | [**createItemsFulfillment**](docs/ItemsApi.md#createitemsfulfillment) | **POST** /items/fulfillment | Create an Item
*ItemsApi* | [**createItemsGovernanceandEthics**](docs/ItemsApi.md#createitemsgovernanceandethics) | **POST** /items/governance_and_ethics | Create an Item
*ItemsApi* | [**createItemsHelpdesk**](docs/ItemsApi.md#createitemshelpdesk) | **POST** /items/helpdesk | Create an Item
*ItemsApi* | [**createItemsInventory**](docs/ItemsApi.md#createitemsinventory) | **POST** /items/inventory | Create an Item
*ItemsApi* | [**createItemsInvoices**](docs/ItemsApi.md#createitemsinvoices) | **POST** /items/invoices | Create an Item
*ItemsApi* | [**createItemsInvoicing**](docs/ItemsApi.md#createitemsinvoicing) | **POST** /items/invoicing | Create an Item
*ItemsApi* | [**createItemsLifecycle**](docs/ItemsApi.md#createitemslifecycle) | **POST** /items/lifecycle | Create an Item
*ItemsApi* | [**createItemsLiveChat**](docs/ItemsApi.md#createitemslivechat) | **POST** /items/live_chat | Create an Item
*ItemsApi* | [**createItemsLoyalty**](docs/ItemsApi.md#createitemsloyalty) | **POST** /items/loyalty | Create an Item
*ItemsApi* | [**createItemsMaintenance**](docs/ItemsApi.md#createitemsmaintenance) | **POST** /items/maintenance | Create an Item
*ItemsApi* | [**createItemsPayroll**](docs/ItemsApi.md#createitemspayroll) | **POST** /items/payroll | Create an Item
*ItemsApi* | [**createItemsPerformance**](docs/ItemsApi.md#createitemsperformance) | **POST** /items/performance | Create an Item
*ItemsApi* | [**createItemsPointofSale**](docs/ItemsApi.md#createitemspointofsale) | **POST** /items/point_of_sale | Create an Item
*ItemsApi* | [**createItemsPolicy**](docs/ItemsApi.md#createitemspolicy) | **POST** /items/policy | Create an Item
*ItemsApi* | [**createItemsProcurement**](docs/ItemsApi.md#createitemsprocurement) | **POST** /items/procurement | Create an Item
*ItemsApi* | [**createItemsProductionBatch**](docs/ItemsApi.md#createitemsproductionbatch) | **POST** /items/production_batch | Create an Item
*ItemsApi* | [**createItemsProject**](docs/ItemsApi.md#createitemsproject) | **POST** /items/project | Create an Item
*ItemsApi* | [**createItemsPurchaseOrders**](docs/ItemsApi.md#createitemspurchaseorders) | **POST** /items/purchase_orders | Create an Item
*ItemsApi* | [**createItemsQualityCheck**](docs/ItemsApi.md#createitemsqualitycheck) | **POST** /items/quality_check | Create an Item
*ItemsApi* | [**createItemsQuotes**](docs/ItemsApi.md#createitemsquotes) | **POST** /items/quotes | Create an Item
*ItemsApi* | [**createItemsRecruit**](docs/ItemsApi.md#createitemsrecruit) | **POST** /items/recruit | Create an Item
*ItemsApi* | [**createItemsRegulations**](docs/ItemsApi.md#createitemsregulations) | **POST** /items/regulations | Create an Item
*ItemsApi* | [**createItemsRentals**](docs/ItemsApi.md#createitemsrentals) | **POST** /items/rentals | Create an Item
*ItemsApi* | [**createItemsShipment**](docs/ItemsApi.md#createitemsshipment) | **POST** /items/shipment | Create an Item
*ItemsApi* | [**createItemsSocialMedia**](docs/ItemsApi.md#createitemssocialmedia) | **POST** /items/social_media | Create an Item
*ItemsApi* | [**createItemsSocialResponsibility**](docs/ItemsApi.md#createitemssocialresponsibility) | **POST** /items/social_responsibility | Create an Item
*ItemsApi* | [**createItemsSuppliers**](docs/ItemsApi.md#createitemssuppliers) | **POST** /items/suppliers | Create an Item
*ItemsApi* | [**createItemsSurveys**](docs/ItemsApi.md#createitemssurveys) | **POST** /items/surveys | Create an Item
*ItemsApi* | [**createItemsSustainableSupplyChain**](docs/ItemsApi.md#createitemssustainablesupplychain) | **POST** /items/sustainable_supply_chain | Create an Item
*ItemsApi* | [**createItemsTaxes**](docs/ItemsApi.md#createitemstaxes) | **POST** /items/taxes | Create an Item
*ItemsApi* | [**createItemsTraining**](docs/ItemsApi.md#createitemstraining) | **POST** /items/training | Create an Item
*ItemsApi* | [**createItemsTransactions**](docs/ItemsApi.md#createitemstransactions) | **POST** /items/transactions | Create an Item
*ItemsApi* | [**deleteItemsAccounts**](docs/ItemsApi.md#deleteitemsaccounts) | **DELETE** /items/accounts | Delete Multiple Items
*ItemsApi* | [**deleteItemsAppointments**](docs/ItemsApi.md#deleteitemsappointments) | **DELETE** /items/appointments | Delete Multiple Items
*ItemsApi* | [**deleteItemsBudgets**](docs/ItemsApi.md#deleteitemsbudgets) | **DELETE** /items/budgets | Delete Multiple Items
*ItemsApi* | [**deleteItemsCampaigns**](docs/ItemsApi.md#deleteitemscampaigns) | **DELETE** /items/campaigns | Delete Multiple Items
*ItemsApi* | [**deleteItemsCarbonFootprint**](docs/ItemsApi.md#deleteitemscarbonfootprint) | **DELETE** /items/carbon_footprint | Delete Multiple Items
*ItemsApi* | [**deleteItemsCompanyAssets**](docs/ItemsApi.md#deleteitemscompanyassets) | **DELETE** /items/company_assets | Delete Multiple Items
*ItemsApi* | [**deleteItemsContent**](docs/ItemsApi.md#deleteitemscontent) | **DELETE** /items/content | Delete Multiple Items
*ItemsApi* | [**deleteItemsContracts**](docs/ItemsApi.md#deleteitemscontracts) | **DELETE** /items/contracts | Delete Multiple Items
*ItemsApi* | [**deleteItemsCrm**](docs/ItemsApi.md#deleteitemscrm) | **DELETE** /items/crm | Delete Multiple Items
*ItemsApi* | [**deleteItemsDepartment**](docs/ItemsApi.md#deleteitemsdepartment) | **DELETE** /items/department | Delete Multiple Items
*ItemsApi* | [**deleteItemsDistribution**](docs/ItemsApi.md#deleteitemsdistribution) | **DELETE** /items/distribution | Delete Multiple Items
*ItemsApi* | [**deleteItemsEmailCampaigns**](docs/ItemsApi.md#deleteitemsemailcampaigns) | **DELETE** /items/email_campaigns | Delete Multiple Items
*ItemsApi* | [**deleteItemsEmployeeDirectory**](docs/ItemsApi.md#deleteitemsemployeedirectory) | **DELETE** /items/employee_directory | Delete Multiple Items
*ItemsApi* | [**deleteItemsEnergyEfficiency**](docs/ItemsApi.md#deleteitemsenergyefficiency) | **DELETE** /items/energy_efficiency | Delete Multiple Items
*ItemsApi* | [**deleteItemsEnvironmentalCompliance**](docs/ItemsApi.md#deleteitemsenvironmentalcompliance) | **DELETE** /items/environmental_compliance | Delete Multiple Items
*ItemsApi* | [**deleteItemsEvents**](docs/ItemsApi.md#deleteitemsevents) | **DELETE** /items/events | Delete Multiple Items
*ItemsApi* | [**deleteItemsExpenses**](docs/ItemsApi.md#deleteitemsexpenses) | **DELETE** /items/expenses | Delete Multiple Items
*ItemsApi* | [**deleteItemsFacilities**](docs/ItemsApi.md#deleteitemsfacilities) | **DELETE** /items/facilities | Delete Multiple Items
*ItemsApi* | [**deleteItemsFeedback**](docs/ItemsApi.md#deleteitemsfeedback) | **DELETE** /items/feedback | Delete Multiple Items
*ItemsApi* | [**deleteItemsForum**](docs/ItemsApi.md#deleteitemsforum) | **DELETE** /items/forum | Delete Multiple Items
*ItemsApi* | [**deleteItemsFulfillment**](docs/ItemsApi.md#deleteitemsfulfillment) | **DELETE** /items/fulfillment | Delete Multiple Items
*ItemsApi* | [**deleteItemsGovernanceandEthics**](docs/ItemsApi.md#deleteitemsgovernanceandethics) | **DELETE** /items/governance_and_ethics | Delete Multiple Items
*ItemsApi* | [**deleteItemsHelpdesk**](docs/ItemsApi.md#deleteitemshelpdesk) | **DELETE** /items/helpdesk | Delete Multiple Items
*ItemsApi* | [**deleteItemsInventory**](docs/ItemsApi.md#deleteitemsinventory) | **DELETE** /items/inventory | Delete Multiple Items
*ItemsApi* | [**deleteItemsInvoices**](docs/ItemsApi.md#deleteitemsinvoices) | **DELETE** /items/invoices | Delete Multiple Items
*ItemsApi* | [**deleteItemsInvoicing**](docs/ItemsApi.md#deleteitemsinvoicing) | **DELETE** /items/invoicing | Delete Multiple Items
*ItemsApi* | [**deleteItemsLifecycle**](docs/ItemsApi.md#deleteitemslifecycle) | **DELETE** /items/lifecycle | Delete Multiple Items
*ItemsApi* | [**deleteItemsLiveChat**](docs/ItemsApi.md#deleteitemslivechat) | **DELETE** /items/live_chat | Delete Multiple Items
*ItemsApi* | [**deleteItemsLoyalty**](docs/ItemsApi.md#deleteitemsloyalty) | **DELETE** /items/loyalty | Delete Multiple Items
*ItemsApi* | [**deleteItemsMaintenance**](docs/ItemsApi.md#deleteitemsmaintenance) | **DELETE** /items/maintenance | Delete Multiple Items
*ItemsApi* | [**deleteItemsPayroll**](docs/ItemsApi.md#deleteitemspayroll) | **DELETE** /items/payroll | Delete Multiple Items
*ItemsApi* | [**deleteItemsPerformance**](docs/ItemsApi.md#deleteitemsperformance) | **DELETE** /items/performance | Delete Multiple Items
*ItemsApi* | [**deleteItemsPointofSale**](docs/ItemsApi.md#deleteitemspointofsale) | **DELETE** /items/point_of_sale | Delete Multiple Items
*ItemsApi* | [**deleteItemsPolicy**](docs/ItemsApi.md#deleteitemspolicy) | **DELETE** /items/policy | Delete Multiple Items
*ItemsApi* | [**deleteItemsProcurement**](docs/ItemsApi.md#deleteitemsprocurement) | **DELETE** /items/procurement | Delete Multiple Items
*ItemsApi* | [**deleteItemsProductionBatch**](docs/ItemsApi.md#deleteitemsproductionbatch) | **DELETE** /items/production_batch | Delete Multiple Items
*ItemsApi* | [**deleteItemsProject**](docs/ItemsApi.md#deleteitemsproject) | **DELETE** /items/project | Delete Multiple Items
*ItemsApi* | [**deleteItemsPurchaseOrders**](docs/ItemsApi.md#deleteitemspurchaseorders) | **DELETE** /items/purchase_orders | Delete Multiple Items
*ItemsApi* | [**deleteItemsQualityCheck**](docs/ItemsApi.md#deleteitemsqualitycheck) | **DELETE** /items/quality_check | Delete Multiple Items
*ItemsApi* | [**deleteItemsQuotes**](docs/ItemsApi.md#deleteitemsquotes) | **DELETE** /items/quotes | Delete Multiple Items
*ItemsApi* | [**deleteItemsRecruit**](docs/ItemsApi.md#deleteitemsrecruit) | **DELETE** /items/recruit | Delete Multiple Items
*ItemsApi* | [**deleteItemsRegulations**](docs/ItemsApi.md#deleteitemsregulations) | **DELETE** /items/regulations | Delete Multiple Items
*ItemsApi* | [**deleteItemsRentals**](docs/ItemsApi.md#deleteitemsrentals) | **DELETE** /items/rentals | Delete Multiple Items
*ItemsApi* | [**deleteItemsShipment**](docs/ItemsApi.md#deleteitemsshipment) | **DELETE** /items/shipment | Delete Multiple Items
*ItemsApi* | [**deleteItemsSocialMedia**](docs/ItemsApi.md#deleteitemssocialmedia) | **DELETE** /items/social_media | Delete Multiple Items
*ItemsApi* | [**deleteItemsSocialResponsibility**](docs/ItemsApi.md#deleteitemssocialresponsibility) | **DELETE** /items/social_responsibility | Delete Multiple Items
*ItemsApi* | [**deleteItemsSuppliers**](docs/ItemsApi.md#deleteitemssuppliers) | **DELETE** /items/suppliers | Delete Multiple Items
*ItemsApi* | [**deleteItemsSurveys**](docs/ItemsApi.md#deleteitemssurveys) | **DELETE** /items/surveys | Delete Multiple Items
*ItemsApi* | [**deleteItemsSustainableSupplyChain**](docs/ItemsApi.md#deleteitemssustainablesupplychain) | **DELETE** /items/sustainable_supply_chain | Delete Multiple Items
*ItemsApi* | [**deleteItemsTaxes**](docs/ItemsApi.md#deleteitemstaxes) | **DELETE** /items/taxes | Delete Multiple Items
*ItemsApi* | [**deleteItemsTraining**](docs/ItemsApi.md#deleteitemstraining) | **DELETE** /items/training | Delete Multiple Items
*ItemsApi* | [**deleteItemsTransactions**](docs/ItemsApi.md#deleteitemstransactions) | **DELETE** /items/transactions | Delete Multiple Items
*ItemsApi* | [**deleteSingleItemsAccounts**](docs/ItemsApi.md#deletesingleitemsaccounts) | **DELETE** /items/accounts/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsAppointments**](docs/ItemsApi.md#deletesingleitemsappointments) | **DELETE** /items/appointments/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsBudgets**](docs/ItemsApi.md#deletesingleitemsbudgets) | **DELETE** /items/budgets/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsCampaigns**](docs/ItemsApi.md#deletesingleitemscampaigns) | **DELETE** /items/campaigns/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsCarbonFootprint**](docs/ItemsApi.md#deletesingleitemscarbonfootprint) | **DELETE** /items/carbon_footprint/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsCompanyAssets**](docs/ItemsApi.md#deletesingleitemscompanyassets) | **DELETE** /items/company_assets/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsContent**](docs/ItemsApi.md#deletesingleitemscontent) | **DELETE** /items/content/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsContracts**](docs/ItemsApi.md#deletesingleitemscontracts) | **DELETE** /items/contracts/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsCrm**](docs/ItemsApi.md#deletesingleitemscrm) | **DELETE** /items/crm/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsDepartment**](docs/ItemsApi.md#deletesingleitemsdepartment) | **DELETE** /items/department/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsDistribution**](docs/ItemsApi.md#deletesingleitemsdistribution) | **DELETE** /items/distribution/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsEmailCampaigns**](docs/ItemsApi.md#deletesingleitemsemailcampaigns) | **DELETE** /items/email_campaigns/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsEmployeeDirectory**](docs/ItemsApi.md#deletesingleitemsemployeedirectory) | **DELETE** /items/employee_directory/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsEnergyEfficiency**](docs/ItemsApi.md#deletesingleitemsenergyefficiency) | **DELETE** /items/energy_efficiency/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsEnvironmentalCompliance**](docs/ItemsApi.md#deletesingleitemsenvironmentalcompliance) | **DELETE** /items/environmental_compliance/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsEvents**](docs/ItemsApi.md#deletesingleitemsevents) | **DELETE** /items/events/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsExpenses**](docs/ItemsApi.md#deletesingleitemsexpenses) | **DELETE** /items/expenses/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsFacilities**](docs/ItemsApi.md#deletesingleitemsfacilities) | **DELETE** /items/facilities/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsFeedback**](docs/ItemsApi.md#deletesingleitemsfeedback) | **DELETE** /items/feedback/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsForum**](docs/ItemsApi.md#deletesingleitemsforum) | **DELETE** /items/forum/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsFulfillment**](docs/ItemsApi.md#deletesingleitemsfulfillment) | **DELETE** /items/fulfillment/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsGovernanceandEthics**](docs/ItemsApi.md#deletesingleitemsgovernanceandethics) | **DELETE** /items/governance_and_ethics/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsHelpdesk**](docs/ItemsApi.md#deletesingleitemshelpdesk) | **DELETE** /items/helpdesk/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsInventory**](docs/ItemsApi.md#deletesingleitemsinventory) | **DELETE** /items/inventory/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsInvoices**](docs/ItemsApi.md#deletesingleitemsinvoices) | **DELETE** /items/invoices/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsInvoicing**](docs/ItemsApi.md#deletesingleitemsinvoicing) | **DELETE** /items/invoicing/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsLifecycle**](docs/ItemsApi.md#deletesingleitemslifecycle) | **DELETE** /items/lifecycle/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsLiveChat**](docs/ItemsApi.md#deletesingleitemslivechat) | **DELETE** /items/live_chat/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsLoyalty**](docs/ItemsApi.md#deletesingleitemsloyalty) | **DELETE** /items/loyalty/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsMaintenance**](docs/ItemsApi.md#deletesingleitemsmaintenance) | **DELETE** /items/maintenance/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsPayroll**](docs/ItemsApi.md#deletesingleitemspayroll) | **DELETE** /items/payroll/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsPerformance**](docs/ItemsApi.md#deletesingleitemsperformance) | **DELETE** /items/performance/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsPointofSale**](docs/ItemsApi.md#deletesingleitemspointofsale) | **DELETE** /items/point_of_sale/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsPolicy**](docs/ItemsApi.md#deletesingleitemspolicy) | **DELETE** /items/policy/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsProcurement**](docs/ItemsApi.md#deletesingleitemsprocurement) | **DELETE** /items/procurement/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsProductionBatch**](docs/ItemsApi.md#deletesingleitemsproductionbatch) | **DELETE** /items/production_batch/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsProject**](docs/ItemsApi.md#deletesingleitemsproject) | **DELETE** /items/project/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsPurchaseOrders**](docs/ItemsApi.md#deletesingleitemspurchaseorders) | **DELETE** /items/purchase_orders/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsQualityCheck**](docs/ItemsApi.md#deletesingleitemsqualitycheck) | **DELETE** /items/quality_check/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsQuotes**](docs/ItemsApi.md#deletesingleitemsquotes) | **DELETE** /items/quotes/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsRecruit**](docs/ItemsApi.md#deletesingleitemsrecruit) | **DELETE** /items/recruit/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsRegulations**](docs/ItemsApi.md#deletesingleitemsregulations) | **DELETE** /items/regulations/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsRentals**](docs/ItemsApi.md#deletesingleitemsrentals) | **DELETE** /items/rentals/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsShipment**](docs/ItemsApi.md#deletesingleitemsshipment) | **DELETE** /items/shipment/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsSocialMedia**](docs/ItemsApi.md#deletesingleitemssocialmedia) | **DELETE** /items/social_media/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsSocialResponsibility**](docs/ItemsApi.md#deletesingleitemssocialresponsibility) | **DELETE** /items/social_responsibility/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsSuppliers**](docs/ItemsApi.md#deletesingleitemssuppliers) | **DELETE** /items/suppliers/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsSurveys**](docs/ItemsApi.md#deletesingleitemssurveys) | **DELETE** /items/surveys/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsSustainableSupplyChain**](docs/ItemsApi.md#deletesingleitemssustainablesupplychain) | **DELETE** /items/sustainable_supply_chain/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsTaxes**](docs/ItemsApi.md#deletesingleitemstaxes) | **DELETE** /items/taxes/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsTraining**](docs/ItemsApi.md#deletesingleitemstraining) | **DELETE** /items/training/{id} | Delete an Item
*ItemsApi* | [**deleteSingleItemsTransactions**](docs/ItemsApi.md#deletesingleitemstransactions) | **DELETE** /items/transactions/{id} | Delete an Item
*ItemsApi* | [**readItemsAccounts**](docs/ItemsApi.md#readitemsaccounts) | **GET** /items/accounts | List Items
*ItemsApi* | [**readItemsAppointments**](docs/ItemsApi.md#readitemsappointments) | **GET** /items/appointments | List Items
*ItemsApi* | [**readItemsBudgets**](docs/ItemsApi.md#readitemsbudgets) | **GET** /items/budgets | List Items
*ItemsApi* | [**readItemsCampaigns**](docs/ItemsApi.md#readitemscampaigns) | **GET** /items/campaigns | List Items
*ItemsApi* | [**readItemsCarbonFootprint**](docs/ItemsApi.md#readitemscarbonfootprint) | **GET** /items/carbon_footprint | List Items
*ItemsApi* | [**readItemsCompanyAssets**](docs/ItemsApi.md#readitemscompanyassets) | **GET** /items/company_assets | List Items
*ItemsApi* | [**readItemsContent**](docs/ItemsApi.md#readitemscontent) | **GET** /items/content | List Items
*ItemsApi* | [**readItemsContracts**](docs/ItemsApi.md#readitemscontracts) | **GET** /items/contracts | List Items
*ItemsApi* | [**readItemsCrm**](docs/ItemsApi.md#readitemscrm) | **GET** /items/crm | List Items
*ItemsApi* | [**readItemsDepartment**](docs/ItemsApi.md#readitemsdepartment) | **GET** /items/department | List Items
*ItemsApi* | [**readItemsDistribution**](docs/ItemsApi.md#readitemsdistribution) | **GET** /items/distribution | List Items
*ItemsApi* | [**readItemsEmailCampaigns**](docs/ItemsApi.md#readitemsemailcampaigns) | **GET** /items/email_campaigns | List Items
*ItemsApi* | [**readItemsEmployeeDirectory**](docs/ItemsApi.md#readitemsemployeedirectory) | **GET** /items/employee_directory | List Items
*ItemsApi* | [**readItemsEnergyEfficiency**](docs/ItemsApi.md#readitemsenergyefficiency) | **GET** /items/energy_efficiency | List Items
*ItemsApi* | [**readItemsEnvironmentalCompliance**](docs/ItemsApi.md#readitemsenvironmentalcompliance) | **GET** /items/environmental_compliance | List Items
*ItemsApi* | [**readItemsEvents**](docs/ItemsApi.md#readitemsevents) | **GET** /items/events | List Items
*ItemsApi* | [**readItemsExpenses**](docs/ItemsApi.md#readitemsexpenses) | **GET** /items/expenses | List Items
*ItemsApi* | [**readItemsFacilities**](docs/ItemsApi.md#readitemsfacilities) | **GET** /items/facilities | List Items
*ItemsApi* | [**readItemsFeedback**](docs/ItemsApi.md#readitemsfeedback) | **GET** /items/feedback | List Items
*ItemsApi* | [**readItemsForum**](docs/ItemsApi.md#readitemsforum) | **GET** /items/forum | List Items
*ItemsApi* | [**readItemsFulfillment**](docs/ItemsApi.md#readitemsfulfillment) | **GET** /items/fulfillment | List Items
*ItemsApi* | [**readItemsGovernanceandEthics**](docs/ItemsApi.md#readitemsgovernanceandethics) | **GET** /items/governance_and_ethics | List Items
*ItemsApi* | [**readItemsHelpdesk**](docs/ItemsApi.md#readitemshelpdesk) | **GET** /items/helpdesk | List Items
*ItemsApi* | [**readItemsInventory**](docs/ItemsApi.md#readitemsinventory) | **GET** /items/inventory | List Items
*ItemsApi* | [**readItemsInvoices**](docs/ItemsApi.md#readitemsinvoices) | **GET** /items/invoices | List Items
*ItemsApi* | [**readItemsInvoicing**](docs/ItemsApi.md#readitemsinvoicing) | **GET** /items/invoicing | List Items
*ItemsApi* | [**readItemsLifecycle**](docs/ItemsApi.md#readitemslifecycle) | **GET** /items/lifecycle | List Items
*ItemsApi* | [**readItemsLiveChat**](docs/ItemsApi.md#readitemslivechat) | **GET** /items/live_chat | List Items
*ItemsApi* | [**readItemsLoyalty**](docs/ItemsApi.md#readitemsloyalty) | **GET** /items/loyalty | List Items
*ItemsApi* | [**readItemsMaintenance**](docs/ItemsApi.md#readitemsmaintenance) | **GET** /items/maintenance | List Items
*ItemsApi* | [**readItemsPayroll**](docs/ItemsApi.md#readitemspayroll) | **GET** /items/payroll | List Items
*ItemsApi* | [**readItemsPerformance**](docs/ItemsApi.md#readitemsperformance) | **GET** /items/performance | List Items
*ItemsApi* | [**readItemsPointofSale**](docs/ItemsApi.md#readitemspointofsale) | **GET** /items/point_of_sale | List Items
*ItemsApi* | [**readItemsPolicy**](docs/ItemsApi.md#readitemspolicy) | **GET** /items/policy | List Items
*ItemsApi* | [**readItemsProcurement**](docs/ItemsApi.md#readitemsprocurement) | **GET** /items/procurement | List Items
*ItemsApi* | [**readItemsProductionBatch**](docs/ItemsApi.md#readitemsproductionbatch) | **GET** /items/production_batch | List Items
*ItemsApi* | [**readItemsProject**](docs/ItemsApi.md#readitemsproject) | **GET** /items/project | List Items
*ItemsApi* | [**readItemsPurchaseOrders**](docs/ItemsApi.md#readitemspurchaseorders) | **GET** /items/purchase_orders | List Items
*ItemsApi* | [**readItemsQualityCheck**](docs/ItemsApi.md#readitemsqualitycheck) | **GET** /items/quality_check | List Items
*ItemsApi* | [**readItemsQuotes**](docs/ItemsApi.md#readitemsquotes) | **GET** /items/quotes | List Items
*ItemsApi* | [**readItemsRecruit**](docs/ItemsApi.md#readitemsrecruit) | **GET** /items/recruit | List Items
*ItemsApi* | [**readItemsRegulations**](docs/ItemsApi.md#readitemsregulations) | **GET** /items/regulations | List Items
*ItemsApi* | [**readItemsRentals**](docs/ItemsApi.md#readitemsrentals) | **GET** /items/rentals | List Items
*ItemsApi* | [**readItemsShipment**](docs/ItemsApi.md#readitemsshipment) | **GET** /items/shipment | List Items
*ItemsApi* | [**readItemsSocialMedia**](docs/ItemsApi.md#readitemssocialmedia) | **GET** /items/social_media | List Items
*ItemsApi* | [**readItemsSocialResponsibility**](docs/ItemsApi.md#readitemssocialresponsibility) | **GET** /items/social_responsibility | List Items
*ItemsApi* | [**readItemsSuppliers**](docs/ItemsApi.md#readitemssuppliers) | **GET** /items/suppliers | List Items
*ItemsApi* | [**readItemsSurveys**](docs/ItemsApi.md#readitemssurveys) | **GET** /items/surveys | List Items
*ItemsApi* | [**readItemsSustainableSupplyChain**](docs/ItemsApi.md#readitemssustainablesupplychain) | **GET** /items/sustainable_supply_chain | List Items
*ItemsApi* | [**readItemsTaxes**](docs/ItemsApi.md#readitemstaxes) | **GET** /items/taxes | List Items
*ItemsApi* | [**readItemsTraining**](docs/ItemsApi.md#readitemstraining) | **GET** /items/training | List Items
*ItemsApi* | [**readItemsTransactions**](docs/ItemsApi.md#readitemstransactions) | **GET** /items/transactions | List Items
*ItemsApi* | [**readSingleItemsAccounts**](docs/ItemsApi.md#readsingleitemsaccounts) | **GET** /items/accounts/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsAppointments**](docs/ItemsApi.md#readsingleitemsappointments) | **GET** /items/appointments/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsBudgets**](docs/ItemsApi.md#readsingleitemsbudgets) | **GET** /items/budgets/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsCampaigns**](docs/ItemsApi.md#readsingleitemscampaigns) | **GET** /items/campaigns/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsCarbonFootprint**](docs/ItemsApi.md#readsingleitemscarbonfootprint) | **GET** /items/carbon_footprint/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsCompanyAssets**](docs/ItemsApi.md#readsingleitemscompanyassets) | **GET** /items/company_assets/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsContent**](docs/ItemsApi.md#readsingleitemscontent) | **GET** /items/content/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsContracts**](docs/ItemsApi.md#readsingleitemscontracts) | **GET** /items/contracts/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsCrm**](docs/ItemsApi.md#readsingleitemscrm) | **GET** /items/crm/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsDepartment**](docs/ItemsApi.md#readsingleitemsdepartment) | **GET** /items/department/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsDistribution**](docs/ItemsApi.md#readsingleitemsdistribution) | **GET** /items/distribution/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsEmailCampaigns**](docs/ItemsApi.md#readsingleitemsemailcampaigns) | **GET** /items/email_campaigns/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsEmployeeDirectory**](docs/ItemsApi.md#readsingleitemsemployeedirectory) | **GET** /items/employee_directory/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsEnergyEfficiency**](docs/ItemsApi.md#readsingleitemsenergyefficiency) | **GET** /items/energy_efficiency/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsEnvironmentalCompliance**](docs/ItemsApi.md#readsingleitemsenvironmentalcompliance) | **GET** /items/environmental_compliance/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsEvents**](docs/ItemsApi.md#readsingleitemsevents) | **GET** /items/events/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsExpenses**](docs/ItemsApi.md#readsingleitemsexpenses) | **GET** /items/expenses/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsFacilities**](docs/ItemsApi.md#readsingleitemsfacilities) | **GET** /items/facilities/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsFeedback**](docs/ItemsApi.md#readsingleitemsfeedback) | **GET** /items/feedback/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsForum**](docs/ItemsApi.md#readsingleitemsforum) | **GET** /items/forum/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsFulfillment**](docs/ItemsApi.md#readsingleitemsfulfillment) | **GET** /items/fulfillment/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsGovernanceandEthics**](docs/ItemsApi.md#readsingleitemsgovernanceandethics) | **GET** /items/governance_and_ethics/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsHelpdesk**](docs/ItemsApi.md#readsingleitemshelpdesk) | **GET** /items/helpdesk/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsInventory**](docs/ItemsApi.md#readsingleitemsinventory) | **GET** /items/inventory/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsInvoices**](docs/ItemsApi.md#readsingleitemsinvoices) | **GET** /items/invoices/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsInvoicing**](docs/ItemsApi.md#readsingleitemsinvoicing) | **GET** /items/invoicing/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsLifecycle**](docs/ItemsApi.md#readsingleitemslifecycle) | **GET** /items/lifecycle/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsLiveChat**](docs/ItemsApi.md#readsingleitemslivechat) | **GET** /items/live_chat/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsLoyalty**](docs/ItemsApi.md#readsingleitemsloyalty) | **GET** /items/loyalty/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsMaintenance**](docs/ItemsApi.md#readsingleitemsmaintenance) | **GET** /items/maintenance/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsPayroll**](docs/ItemsApi.md#readsingleitemspayroll) | **GET** /items/payroll/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsPerformance**](docs/ItemsApi.md#readsingleitemsperformance) | **GET** /items/performance/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsPointofSale**](docs/ItemsApi.md#readsingleitemspointofsale) | **GET** /items/point_of_sale/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsPolicy**](docs/ItemsApi.md#readsingleitemspolicy) | **GET** /items/policy/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsProcurement**](docs/ItemsApi.md#readsingleitemsprocurement) | **GET** /items/procurement/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsProductionBatch**](docs/ItemsApi.md#readsingleitemsproductionbatch) | **GET** /items/production_batch/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsProject**](docs/ItemsApi.md#readsingleitemsproject) | **GET** /items/project/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsPurchaseOrders**](docs/ItemsApi.md#readsingleitemspurchaseorders) | **GET** /items/purchase_orders/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsQualityCheck**](docs/ItemsApi.md#readsingleitemsqualitycheck) | **GET** /items/quality_check/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsQuotes**](docs/ItemsApi.md#readsingleitemsquotes) | **GET** /items/quotes/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsRecruit**](docs/ItemsApi.md#readsingleitemsrecruit) | **GET** /items/recruit/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsRegulations**](docs/ItemsApi.md#readsingleitemsregulations) | **GET** /items/regulations/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsRentals**](docs/ItemsApi.md#readsingleitemsrentals) | **GET** /items/rentals/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsShipment**](docs/ItemsApi.md#readsingleitemsshipment) | **GET** /items/shipment/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsSocialMedia**](docs/ItemsApi.md#readsingleitemssocialmedia) | **GET** /items/social_media/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsSocialResponsibility**](docs/ItemsApi.md#readsingleitemssocialresponsibility) | **GET** /items/social_responsibility/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsSuppliers**](docs/ItemsApi.md#readsingleitemssuppliers) | **GET** /items/suppliers/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsSurveys**](docs/ItemsApi.md#readsingleitemssurveys) | **GET** /items/surveys/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsSustainableSupplyChain**](docs/ItemsApi.md#readsingleitemssustainablesupplychain) | **GET** /items/sustainable_supply_chain/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsTaxes**](docs/ItemsApi.md#readsingleitemstaxes) | **GET** /items/taxes/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsTraining**](docs/ItemsApi.md#readsingleitemstraining) | **GET** /items/training/{id} | Retrieve an Item
*ItemsApi* | [**readSingleItemsTransactions**](docs/ItemsApi.md#readsingleitemstransactions) | **GET** /items/transactions/{id} | Retrieve an Item
*ItemsApi* | [**updateItemsAccounts**](docs/ItemsApi.md#updateitemsaccounts) | **PATCH** /items/accounts | Update Multiple Items
*ItemsApi* | [**updateItemsAppointments**](docs/ItemsApi.md#updateitemsappointments) | **PATCH** /items/appointments | Update Multiple Items
*ItemsApi* | [**updateItemsBudgets**](docs/ItemsApi.md#updateitemsbudgets) | **PATCH** /items/budgets | Update Multiple Items
*ItemsApi* | [**updateItemsCampaigns**](docs/ItemsApi.md#updateitemscampaigns) | **PATCH** /items/campaigns | Update Multiple Items
*ItemsApi* | [**updateItemsCarbonFootprint**](docs/ItemsApi.md#updateitemscarbonfootprint) | **PATCH** /items/carbon_footprint | Update Multiple Items
*ItemsApi* | [**updateItemsCompanyAssets**](docs/ItemsApi.md#updateitemscompanyassets) | **PATCH** /items/company_assets | Update Multiple Items
*ItemsApi* | [**updateItemsContent**](docs/ItemsApi.md#updateitemscontent) | **PATCH** /items/content | Update Multiple Items
*ItemsApi* | [**updateItemsContracts**](docs/ItemsApi.md#updateitemscontracts) | **PATCH** /items/contracts | Update Multiple Items
*ItemsApi* | [**updateItemsCrm**](docs/ItemsApi.md#updateitemscrm) | **PATCH** /items/crm | Update Multiple Items
*ItemsApi* | [**updateItemsDepartment**](docs/ItemsApi.md#updateitemsdepartment) | **PATCH** /items/department | Update Multiple Items
*ItemsApi* | [**updateItemsDistribution**](docs/ItemsApi.md#updateitemsdistribution) | **PATCH** /items/distribution | Update Multiple Items
*ItemsApi* | [**updateItemsEmailCampaigns**](docs/ItemsApi.md#updateitemsemailcampaigns) | **PATCH** /items/email_campaigns | Update Multiple Items
*ItemsApi* | [**updateItemsEmployeeDirectory**](docs/ItemsApi.md#updateitemsemployeedirectory) | **PATCH** /items/employee_directory | Update Multiple Items
*ItemsApi* | [**updateItemsEnergyEfficiency**](docs/ItemsApi.md#updateitemsenergyefficiency) | **PATCH** /items/energy_efficiency | Update Multiple Items
*ItemsApi* | [**updateItemsEnvironmentalCompliance**](docs/ItemsApi.md#updateitemsenvironmentalcompliance) | **PATCH** /items/environmental_compliance | Update Multiple Items
*ItemsApi* | [**updateItemsEvents**](docs/ItemsApi.md#updateitemsevents) | **PATCH** /items/events | Update Multiple Items
*ItemsApi* | [**updateItemsExpenses**](docs/ItemsApi.md#updateitemsexpenses) | **PATCH** /items/expenses | Update Multiple Items
*ItemsApi* | [**updateItemsFacilities**](docs/ItemsApi.md#updateitemsfacilities) | **PATCH** /items/facilities | Update Multiple Items
*ItemsApi* | [**updateItemsFeedback**](docs/ItemsApi.md#updateitemsfeedback) | **PATCH** /items/feedback | Update Multiple Items
*ItemsApi* | [**updateItemsForum**](docs/ItemsApi.md#updateitemsforum) | **PATCH** /items/forum | Update Multiple Items
*ItemsApi* | [**updateItemsFulfillment**](docs/ItemsApi.md#updateitemsfulfillment) | **PATCH** /items/fulfillment | Update Multiple Items
*ItemsApi* | [**updateItemsGovernanceandEthics**](docs/ItemsApi.md#updateitemsgovernanceandethics) | **PATCH** /items/governance_and_ethics | Update Multiple Items
*ItemsApi* | [**updateItemsHelpdesk**](docs/ItemsApi.md#updateitemshelpdesk) | **PATCH** /items/helpdesk | Update Multiple Items
*ItemsApi* | [**updateItemsInventory**](docs/ItemsApi.md#updateitemsinventory) | **PATCH** /items/inventory | Update Multiple Items
*ItemsApi* | [**updateItemsInvoices**](docs/ItemsApi.md#updateitemsinvoices) | **PATCH** /items/invoices | Update Multiple Items
*ItemsApi* | [**updateItemsInvoicing**](docs/ItemsApi.md#updateitemsinvoicing) | **PATCH** /items/invoicing | Update Multiple Items
*ItemsApi* | [**updateItemsLifecycle**](docs/ItemsApi.md#updateitemslifecycle) | **PATCH** /items/lifecycle | Update Multiple Items
*ItemsApi* | [**updateItemsLiveChat**](docs/ItemsApi.md#updateitemslivechat) | **PATCH** /items/live_chat | Update Multiple Items
*ItemsApi* | [**updateItemsLoyalty**](docs/ItemsApi.md#updateitemsloyalty) | **PATCH** /items/loyalty | Update Multiple Items
*ItemsApi* | [**updateItemsMaintenance**](docs/ItemsApi.md#updateitemsmaintenance) | **PATCH** /items/maintenance | Update Multiple Items
*ItemsApi* | [**updateItemsPayroll**](docs/ItemsApi.md#updateitemspayroll) | **PATCH** /items/payroll | Update Multiple Items
*ItemsApi* | [**updateItemsPerformance**](docs/ItemsApi.md#updateitemsperformance) | **PATCH** /items/performance | Update Multiple Items
*ItemsApi* | [**updateItemsPointofSale**](docs/ItemsApi.md#updateitemspointofsale) | **PATCH** /items/point_of_sale | Update Multiple Items
*ItemsApi* | [**updateItemsPolicy**](docs/ItemsApi.md#updateitemspolicy) | **PATCH** /items/policy | Update Multiple Items
*ItemsApi* | [**updateItemsProcurement**](docs/ItemsApi.md#updateitemsprocurement) | **PATCH** /items/procurement | Update Multiple Items
*ItemsApi* | [**updateItemsProductionBatch**](docs/ItemsApi.md#updateitemsproductionbatch) | **PATCH** /items/production_batch | Update Multiple Items
*ItemsApi* | [**updateItemsProject**](docs/ItemsApi.md#updateitemsproject) | **PATCH** /items/project | Update Multiple Items
*ItemsApi* | [**updateItemsPurchaseOrders**](docs/ItemsApi.md#updateitemspurchaseorders) | **PATCH** /items/purchase_orders | Update Multiple Items
*ItemsApi* | [**updateItemsQualityCheck**](docs/ItemsApi.md#updateitemsqualitycheck) | **PATCH** /items/quality_check | Update Multiple Items
*ItemsApi* | [**updateItemsQuotes**](docs/ItemsApi.md#updateitemsquotes) | **PATCH** /items/quotes | Update Multiple Items
*ItemsApi* | [**updateItemsRecruit**](docs/ItemsApi.md#updateitemsrecruit) | **PATCH** /items/recruit | Update Multiple Items
*ItemsApi* | [**updateItemsRegulations**](docs/ItemsApi.md#updateitemsregulations) | **PATCH** /items/regulations | Update Multiple Items
*ItemsApi* | [**updateItemsRentals**](docs/ItemsApi.md#updateitemsrentals) | **PATCH** /items/rentals | Update Multiple Items
*ItemsApi* | [**updateItemsShipment**](docs/ItemsApi.md#updateitemsshipment) | **PATCH** /items/shipment | Update Multiple Items
*ItemsApi* | [**updateItemsSocialMedia**](docs/ItemsApi.md#updateitemssocialmedia) | **PATCH** /items/social_media | Update Multiple Items
*ItemsApi* | [**updateItemsSocialResponsibility**](docs/ItemsApi.md#updateitemssocialresponsibility) | **PATCH** /items/social_responsibility | Update Multiple Items
*ItemsApi* | [**updateItemsSuppliers**](docs/ItemsApi.md#updateitemssuppliers) | **PATCH** /items/suppliers | Update Multiple Items
*ItemsApi* | [**updateItemsSurveys**](docs/ItemsApi.md#updateitemssurveys) | **PATCH** /items/surveys | Update Multiple Items
*ItemsApi* | [**updateItemsSustainableSupplyChain**](docs/ItemsApi.md#updateitemssustainablesupplychain) | **PATCH** /items/sustainable_supply_chain | Update Multiple Items
*ItemsApi* | [**updateItemsTaxes**](docs/ItemsApi.md#updateitemstaxes) | **PATCH** /items/taxes | Update Multiple Items
*ItemsApi* | [**updateItemsTraining**](docs/ItemsApi.md#updateitemstraining) | **PATCH** /items/training | Update Multiple Items
*ItemsApi* | [**updateItemsTransactions**](docs/ItemsApi.md#updateitemstransactions) | **PATCH** /items/transactions | Update Multiple Items
*ItemsApi* | [**updateSingleItemsAccounts**](docs/ItemsApi.md#updatesingleitemsaccounts) | **PATCH** /items/accounts/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsAppointments**](docs/ItemsApi.md#updatesingleitemsappointments) | **PATCH** /items/appointments/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsBudgets**](docs/ItemsApi.md#updatesingleitemsbudgets) | **PATCH** /items/budgets/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsCampaigns**](docs/ItemsApi.md#updatesingleitemscampaigns) | **PATCH** /items/campaigns/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsCarbonFootprint**](docs/ItemsApi.md#updatesingleitemscarbonfootprint) | **PATCH** /items/carbon_footprint/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsCompanyAssets**](docs/ItemsApi.md#updatesingleitemscompanyassets) | **PATCH** /items/company_assets/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsContent**](docs/ItemsApi.md#updatesingleitemscontent) | **PATCH** /items/content/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsContracts**](docs/ItemsApi.md#updatesingleitemscontracts) | **PATCH** /items/contracts/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsCrm**](docs/ItemsApi.md#updatesingleitemscrm) | **PATCH** /items/crm/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsDepartment**](docs/ItemsApi.md#updatesingleitemsdepartment) | **PATCH** /items/department/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsDistribution**](docs/ItemsApi.md#updatesingleitemsdistribution) | **PATCH** /items/distribution/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsEmailCampaigns**](docs/ItemsApi.md#updatesingleitemsemailcampaigns) | **PATCH** /items/email_campaigns/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsEmployeeDirectory**](docs/ItemsApi.md#updatesingleitemsemployeedirectory) | **PATCH** /items/employee_directory/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsEnergyEfficiency**](docs/ItemsApi.md#updatesingleitemsenergyefficiency) | **PATCH** /items/energy_efficiency/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsEnvironmentalCompliance**](docs/ItemsApi.md#updatesingleitemsenvironmentalcompliance) | **PATCH** /items/environmental_compliance/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsEvents**](docs/ItemsApi.md#updatesingleitemsevents) | **PATCH** /items/events/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsExpenses**](docs/ItemsApi.md#updatesingleitemsexpenses) | **PATCH** /items/expenses/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsFacilities**](docs/ItemsApi.md#updatesingleitemsfacilities) | **PATCH** /items/facilities/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsFeedback**](docs/ItemsApi.md#updatesingleitemsfeedback) | **PATCH** /items/feedback/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsForum**](docs/ItemsApi.md#updatesingleitemsforum) | **PATCH** /items/forum/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsFulfillment**](docs/ItemsApi.md#updatesingleitemsfulfillment) | **PATCH** /items/fulfillment/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsGovernanceandEthics**](docs/ItemsApi.md#updatesingleitemsgovernanceandethics) | **PATCH** /items/governance_and_ethics/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsHelpdesk**](docs/ItemsApi.md#updatesingleitemshelpdesk) | **PATCH** /items/helpdesk/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsInventory**](docs/ItemsApi.md#updatesingleitemsinventory) | **PATCH** /items/inventory/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsInvoices**](docs/ItemsApi.md#updatesingleitemsinvoices) | **PATCH** /items/invoices/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsInvoicing**](docs/ItemsApi.md#updatesingleitemsinvoicing) | **PATCH** /items/invoicing/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsLifecycle**](docs/ItemsApi.md#updatesingleitemslifecycle) | **PATCH** /items/lifecycle/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsLiveChat**](docs/ItemsApi.md#updatesingleitemslivechat) | **PATCH** /items/live_chat/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsLoyalty**](docs/ItemsApi.md#updatesingleitemsloyalty) | **PATCH** /items/loyalty/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsMaintenance**](docs/ItemsApi.md#updatesingleitemsmaintenance) | **PATCH** /items/maintenance/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsPayroll**](docs/ItemsApi.md#updatesingleitemspayroll) | **PATCH** /items/payroll/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsPerformance**](docs/ItemsApi.md#updatesingleitemsperformance) | **PATCH** /items/performance/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsPointofSale**](docs/ItemsApi.md#updatesingleitemspointofsale) | **PATCH** /items/point_of_sale/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsPolicy**](docs/ItemsApi.md#updatesingleitemspolicy) | **PATCH** /items/policy/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsProcurement**](docs/ItemsApi.md#updatesingleitemsprocurement) | **PATCH** /items/procurement/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsProductionBatch**](docs/ItemsApi.md#updatesingleitemsproductionbatch) | **PATCH** /items/production_batch/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsProject**](docs/ItemsApi.md#updatesingleitemsproject) | **PATCH** /items/project/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsPurchaseOrders**](docs/ItemsApi.md#updatesingleitemspurchaseorders) | **PATCH** /items/purchase_orders/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsQualityCheck**](docs/ItemsApi.md#updatesingleitemsqualitycheck) | **PATCH** /items/quality_check/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsQuotes**](docs/ItemsApi.md#updatesingleitemsquotes) | **PATCH** /items/quotes/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsRecruit**](docs/ItemsApi.md#updatesingleitemsrecruit) | **PATCH** /items/recruit/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsRegulations**](docs/ItemsApi.md#updatesingleitemsregulations) | **PATCH** /items/regulations/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsRentals**](docs/ItemsApi.md#updatesingleitemsrentals) | **PATCH** /items/rentals/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsShipment**](docs/ItemsApi.md#updatesingleitemsshipment) | **PATCH** /items/shipment/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsSocialMedia**](docs/ItemsApi.md#updatesingleitemssocialmedia) | **PATCH** /items/social_media/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsSocialResponsibility**](docs/ItemsApi.md#updatesingleitemssocialresponsibility) | **PATCH** /items/social_responsibility/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsSuppliers**](docs/ItemsApi.md#updatesingleitemssuppliers) | **PATCH** /items/suppliers/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsSurveys**](docs/ItemsApi.md#updatesingleitemssurveys) | **PATCH** /items/surveys/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsSustainableSupplyChain**](docs/ItemsApi.md#updatesingleitemssustainablesupplychain) | **PATCH** /items/sustainable_supply_chain/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsTaxes**](docs/ItemsApi.md#updatesingleitemstaxes) | **PATCH** /items/taxes/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsTraining**](docs/ItemsApi.md#updatesingleitemstraining) | **PATCH** /items/training/{id} | Update an Item
*ItemsApi* | [**updateSingleItemsTransactions**](docs/ItemsApi.md#updatesingleitemstransactions) | **PATCH** /items/transactions/{id} | Update an Item
*ItemsAccountsApi* | [**createItemsAccounts**](docs/ItemsAccountsApi.md#createitemsaccounts) | **POST** /items/accounts | Create an Item
*ItemsAccountsApi* | [**deleteItemsAccounts**](docs/ItemsAccountsApi.md#deleteitemsaccounts) | **DELETE** /items/accounts | Delete Multiple Items
*ItemsAccountsApi* | [**deleteSingleItemsAccounts**](docs/ItemsAccountsApi.md#deletesingleitemsaccounts) | **DELETE** /items/accounts/{id} | Delete an Item
*ItemsAccountsApi* | [**readItemsAccounts**](docs/ItemsAccountsApi.md#readitemsaccounts) | **GET** /items/accounts | List Items
*ItemsAccountsApi* | [**readSingleItemsAccounts**](docs/ItemsAccountsApi.md#readsingleitemsaccounts) | **GET** /items/accounts/{id} | Retrieve an Item
*ItemsAccountsApi* | [**updateItemsAccounts**](docs/ItemsAccountsApi.md#updateitemsaccounts) | **PATCH** /items/accounts | Update Multiple Items
*ItemsAccountsApi* | [**updateSingleItemsAccounts**](docs/ItemsAccountsApi.md#updatesingleitemsaccounts) | **PATCH** /items/accounts/{id} | Update an Item
*ItemsAppointmentsApi* | [**createItemsAppointments**](docs/ItemsAppointmentsApi.md#createitemsappointments) | **POST** /items/appointments | Create an Item
*ItemsAppointmentsApi* | [**deleteItemsAppointments**](docs/ItemsAppointmentsApi.md#deleteitemsappointments) | **DELETE** /items/appointments | Delete Multiple Items
*ItemsAppointmentsApi* | [**deleteSingleItemsAppointments**](docs/ItemsAppointmentsApi.md#deletesingleitemsappointments) | **DELETE** /items/appointments/{id} | Delete an Item
*ItemsAppointmentsApi* | [**readItemsAppointments**](docs/ItemsAppointmentsApi.md#readitemsappointments) | **GET** /items/appointments | List Items
*ItemsAppointmentsApi* | [**readSingleItemsAppointments**](docs/ItemsAppointmentsApi.md#readsingleitemsappointments) | **GET** /items/appointments/{id} | Retrieve an Item
*ItemsAppointmentsApi* | [**updateItemsAppointments**](docs/ItemsAppointmentsApi.md#updateitemsappointments) | **PATCH** /items/appointments | Update Multiple Items
*ItemsAppointmentsApi* | [**updateSingleItemsAppointments**](docs/ItemsAppointmentsApi.md#updatesingleitemsappointments) | **PATCH** /items/appointments/{id} | Update an Item
*ItemsBudgetsApi* | [**createItemsBudgets**](docs/ItemsBudgetsApi.md#createitemsbudgets) | **POST** /items/budgets | Create an Item
*ItemsBudgetsApi* | [**deleteItemsBudgets**](docs/ItemsBudgetsApi.md#deleteitemsbudgets) | **DELETE** /items/budgets | Delete Multiple Items
*ItemsBudgetsApi* | [**deleteSingleItemsBudgets**](docs/ItemsBudgetsApi.md#deletesingleitemsbudgets) | **DELETE** /items/budgets/{id} | Delete an Item
*ItemsBudgetsApi* | [**readItemsBudgets**](docs/ItemsBudgetsApi.md#readitemsbudgets) | **GET** /items/budgets | List Items
*ItemsBudgetsApi* | [**readSingleItemsBudgets**](docs/ItemsBudgetsApi.md#readsingleitemsbudgets) | **GET** /items/budgets/{id} | Retrieve an Item
*ItemsBudgetsApi* | [**updateItemsBudgets**](docs/ItemsBudgetsApi.md#updateitemsbudgets) | **PATCH** /items/budgets | Update Multiple Items
*ItemsBudgetsApi* | [**updateSingleItemsBudgets**](docs/ItemsBudgetsApi.md#updatesingleitemsbudgets) | **PATCH** /items/budgets/{id} | Update an Item
*ItemsCampaignsApi* | [**createItemsCampaigns**](docs/ItemsCampaignsApi.md#createitemscampaigns) | **POST** /items/campaigns | Create an Item
*ItemsCampaignsApi* | [**deleteItemsCampaigns**](docs/ItemsCampaignsApi.md#deleteitemscampaigns) | **DELETE** /items/campaigns | Delete Multiple Items
*ItemsCampaignsApi* | [**deleteSingleItemsCampaigns**](docs/ItemsCampaignsApi.md#deletesingleitemscampaigns) | **DELETE** /items/campaigns/{id} | Delete an Item
*ItemsCampaignsApi* | [**readItemsCampaigns**](docs/ItemsCampaignsApi.md#readitemscampaigns) | **GET** /items/campaigns | List Items
*ItemsCampaignsApi* | [**readSingleItemsCampaigns**](docs/ItemsCampaignsApi.md#readsingleitemscampaigns) | **GET** /items/campaigns/{id} | Retrieve an Item
*ItemsCampaignsApi* | [**updateItemsCampaigns**](docs/ItemsCampaignsApi.md#updateitemscampaigns) | **PATCH** /items/campaigns | Update Multiple Items
*ItemsCampaignsApi* | [**updateSingleItemsCampaigns**](docs/ItemsCampaignsApi.md#updatesingleitemscampaigns) | **PATCH** /items/campaigns/{id} | Update an Item
*ItemsCarbonFootprintApi* | [**createItemsCarbonFootprint**](docs/ItemsCarbonFootprintApi.md#createitemscarbonfootprint) | **POST** /items/carbon_footprint | Create an Item
*ItemsCarbonFootprintApi* | [**deleteItemsCarbonFootprint**](docs/ItemsCarbonFootprintApi.md#deleteitemscarbonfootprint) | **DELETE** /items/carbon_footprint | Delete Multiple Items
*ItemsCarbonFootprintApi* | [**deleteSingleItemsCarbonFootprint**](docs/ItemsCarbonFootprintApi.md#deletesingleitemscarbonfootprint) | **DELETE** /items/carbon_footprint/{id} | Delete an Item
*ItemsCarbonFootprintApi* | [**readItemsCarbonFootprint**](docs/ItemsCarbonFootprintApi.md#readitemscarbonfootprint) | **GET** /items/carbon_footprint | List Items
*ItemsCarbonFootprintApi* | [**readSingleItemsCarbonFootprint**](docs/ItemsCarbonFootprintApi.md#readsingleitemscarbonfootprint) | **GET** /items/carbon_footprint/{id} | Retrieve an Item
*ItemsCarbonFootprintApi* | [**updateItemsCarbonFootprint**](docs/ItemsCarbonFootprintApi.md#updateitemscarbonfootprint) | **PATCH** /items/carbon_footprint | Update Multiple Items
*ItemsCarbonFootprintApi* | [**updateSingleItemsCarbonFootprint**](docs/ItemsCarbonFootprintApi.md#updatesingleitemscarbonfootprint) | **PATCH** /items/carbon_footprint/{id} | Update an Item
*ItemsCompanyAssetsApi* | [**createItemsCompanyAssets**](docs/ItemsCompanyAssetsApi.md#createitemscompanyassets) | **POST** /items/company_assets | Create an Item
*ItemsCompanyAssetsApi* | [**deleteItemsCompanyAssets**](docs/ItemsCompanyAssetsApi.md#deleteitemscompanyassets) | **DELETE** /items/company_assets | Delete Multiple Items
*ItemsCompanyAssetsApi* | [**deleteSingleItemsCompanyAssets**](docs/ItemsCompanyAssetsApi.md#deletesingleitemscompanyassets) | **DELETE** /items/company_assets/{id} | Delete an Item
*ItemsCompanyAssetsApi* | [**readItemsCompanyAssets**](docs/ItemsCompanyAssetsApi.md#readitemscompanyassets) | **GET** /items/company_assets | List Items
*ItemsCompanyAssetsApi* | [**readSingleItemsCompanyAssets**](docs/ItemsCompanyAssetsApi.md#readsingleitemscompanyassets) | **GET** /items/company_assets/{id} | Retrieve an Item
*ItemsCompanyAssetsApi* | [**updateItemsCompanyAssets**](docs/ItemsCompanyAssetsApi.md#updateitemscompanyassets) | **PATCH** /items/company_assets | Update Multiple Items
*ItemsCompanyAssetsApi* | [**updateSingleItemsCompanyAssets**](docs/ItemsCompanyAssetsApi.md#updatesingleitemscompanyassets) | **PATCH** /items/company_assets/{id} | Update an Item
*ItemsContentApi* | [**createItemsContent**](docs/ItemsContentApi.md#createitemscontent) | **POST** /items/content | Create an Item
*ItemsContentApi* | [**deleteItemsContent**](docs/ItemsContentApi.md#deleteitemscontent) | **DELETE** /items/content | Delete Multiple Items
*ItemsContentApi* | [**deleteSingleItemsContent**](docs/ItemsContentApi.md#deletesingleitemscontent) | **DELETE** /items/content/{id} | Delete an Item
*ItemsContentApi* | [**readItemsContent**](docs/ItemsContentApi.md#readitemscontent) | **GET** /items/content | List Items
*ItemsContentApi* | [**readSingleItemsContent**](docs/ItemsContentApi.md#readsingleitemscontent) | **GET** /items/content/{id} | Retrieve an Item
*ItemsContentApi* | [**updateItemsContent**](docs/ItemsContentApi.md#updateitemscontent) | **PATCH** /items/content | Update Multiple Items
*ItemsContentApi* | [**updateSingleItemsContent**](docs/ItemsContentApi.md#updatesingleitemscontent) | **PATCH** /items/content/{id} | Update an Item
*ItemsContractsApi* | [**createItemsContracts**](docs/ItemsContractsApi.md#createitemscontracts) | **POST** /items/contracts | Create an Item
*ItemsContractsApi* | [**deleteItemsContracts**](docs/ItemsContractsApi.md#deleteitemscontracts) | **DELETE** /items/contracts | Delete Multiple Items
*ItemsContractsApi* | [**deleteSingleItemsContracts**](docs/ItemsContractsApi.md#deletesingleitemscontracts) | **DELETE** /items/contracts/{id} | Delete an Item
*ItemsContractsApi* | [**readItemsContracts**](docs/ItemsContractsApi.md#readitemscontracts) | **GET** /items/contracts | List Items
*ItemsContractsApi* | [**readSingleItemsContracts**](docs/ItemsContractsApi.md#readsingleitemscontracts) | **GET** /items/contracts/{id} | Retrieve an Item
*ItemsContractsApi* | [**updateItemsContracts**](docs/ItemsContractsApi.md#updateitemscontracts) | **PATCH** /items/contracts | Update Multiple Items
*ItemsContractsApi* | [**updateSingleItemsContracts**](docs/ItemsContractsApi.md#updatesingleitemscontracts) | **PATCH** /items/contracts/{id} | Update an Item
*ItemsCrmApi* | [**createItemsCrm**](docs/ItemsCrmApi.md#createitemscrm) | **POST** /items/crm | Create an Item
*ItemsCrmApi* | [**deleteItemsCrm**](docs/ItemsCrmApi.md#deleteitemscrm) | **DELETE** /items/crm | Delete Multiple Items
*ItemsCrmApi* | [**deleteSingleItemsCrm**](docs/ItemsCrmApi.md#deletesingleitemscrm) | **DELETE** /items/crm/{id} | Delete an Item
*ItemsCrmApi* | [**readItemsCrm**](docs/ItemsCrmApi.md#readitemscrm) | **GET** /items/crm | List Items
*ItemsCrmApi* | [**readSingleItemsCrm**](docs/ItemsCrmApi.md#readsingleitemscrm) | **GET** /items/crm/{id} | Retrieve an Item
*ItemsCrmApi* | [**updateItemsCrm**](docs/ItemsCrmApi.md#updateitemscrm) | **PATCH** /items/crm | Update Multiple Items
*ItemsCrmApi* | [**updateSingleItemsCrm**](docs/ItemsCrmApi.md#updatesingleitemscrm) | **PATCH** /items/crm/{id} | Update an Item
*ItemsDepartmentApi* | [**createItemsDepartment**](docs/ItemsDepartmentApi.md#createitemsdepartment) | **POST** /items/department | Create an Item
*ItemsDepartmentApi* | [**deleteItemsDepartment**](docs/ItemsDepartmentApi.md#deleteitemsdepartment) | **DELETE** /items/department | Delete Multiple Items
*ItemsDepartmentApi* | [**deleteSingleItemsDepartment**](docs/ItemsDepartmentApi.md#deletesingleitemsdepartment) | **DELETE** /items/department/{id} | Delete an Item
*ItemsDepartmentApi* | [**readItemsDepartment**](docs/ItemsDepartmentApi.md#readitemsdepartment) | **GET** /items/department | List Items
*ItemsDepartmentApi* | [**readSingleItemsDepartment**](docs/ItemsDepartmentApi.md#readsingleitemsdepartment) | **GET** /items/department/{id} | Retrieve an Item
*ItemsDepartmentApi* | [**updateItemsDepartment**](docs/ItemsDepartmentApi.md#updateitemsdepartment) | **PATCH** /items/department | Update Multiple Items
*ItemsDepartmentApi* | [**updateSingleItemsDepartment**](docs/ItemsDepartmentApi.md#updatesingleitemsdepartment) | **PATCH** /items/department/{id} | Update an Item
*ItemsDistributionApi* | [**createItemsDistribution**](docs/ItemsDistributionApi.md#createitemsdistribution) | **POST** /items/distribution | Create an Item
*ItemsDistributionApi* | [**deleteItemsDistribution**](docs/ItemsDistributionApi.md#deleteitemsdistribution) | **DELETE** /items/distribution | Delete Multiple Items
*ItemsDistributionApi* | [**deleteSingleItemsDistribution**](docs/ItemsDistributionApi.md#deletesingleitemsdistribution) | **DELETE** /items/distribution/{id} | Delete an Item
*ItemsDistributionApi* | [**readItemsDistribution**](docs/ItemsDistributionApi.md#readitemsdistribution) | **GET** /items/distribution | List Items
*ItemsDistributionApi* | [**readSingleItemsDistribution**](docs/ItemsDistributionApi.md#readsingleitemsdistribution) | **GET** /items/distribution/{id} | Retrieve an Item
*ItemsDistributionApi* | [**updateItemsDistribution**](docs/ItemsDistributionApi.md#updateitemsdistribution) | **PATCH** /items/distribution | Update Multiple Items
*ItemsDistributionApi* | [**updateSingleItemsDistribution**](docs/ItemsDistributionApi.md#updatesingleitemsdistribution) | **PATCH** /items/distribution/{id} | Update an Item
*ItemsEmailCampaignsApi* | [**createItemsEmailCampaigns**](docs/ItemsEmailCampaignsApi.md#createitemsemailcampaigns) | **POST** /items/email_campaigns | Create an Item
*ItemsEmailCampaignsApi* | [**deleteItemsEmailCampaigns**](docs/ItemsEmailCampaignsApi.md#deleteitemsemailcampaigns) | **DELETE** /items/email_campaigns | Delete Multiple Items
*ItemsEmailCampaignsApi* | [**deleteSingleItemsEmailCampaigns**](docs/ItemsEmailCampaignsApi.md#deletesingleitemsemailcampaigns) | **DELETE** /items/email_campaigns/{id} | Delete an Item
*ItemsEmailCampaignsApi* | [**readItemsEmailCampaigns**](docs/ItemsEmailCampaignsApi.md#readitemsemailcampaigns) | **GET** /items/email_campaigns | List Items
*ItemsEmailCampaignsApi* | [**readSingleItemsEmailCampaigns**](docs/ItemsEmailCampaignsApi.md#readsingleitemsemailcampaigns) | **GET** /items/email_campaigns/{id} | Retrieve an Item
*ItemsEmailCampaignsApi* | [**updateItemsEmailCampaigns**](docs/ItemsEmailCampaignsApi.md#updateitemsemailcampaigns) | **PATCH** /items/email_campaigns | Update Multiple Items
*ItemsEmailCampaignsApi* | [**updateSingleItemsEmailCampaigns**](docs/ItemsEmailCampaignsApi.md#updatesingleitemsemailcampaigns) | **PATCH** /items/email_campaigns/{id} | Update an Item
*ItemsEmployeeDirectoryApi* | [**createItemsEmployeeDirectory**](docs/ItemsEmployeeDirectoryApi.md#createitemsemployeedirectory) | **POST** /items/employee_directory | Create an Item
*ItemsEmployeeDirectoryApi* | [**deleteItemsEmployeeDirectory**](docs/ItemsEmployeeDirectoryApi.md#deleteitemsemployeedirectory) | **DELETE** /items/employee_directory | Delete Multiple Items
*ItemsEmployeeDirectoryApi* | [**deleteSingleItemsEmployeeDirectory**](docs/ItemsEmployeeDirectoryApi.md#deletesingleitemsemployeedirectory) | **DELETE** /items/employee_directory/{id} | Delete an Item
*ItemsEmployeeDirectoryApi* | [**readItemsEmployeeDirectory**](docs/ItemsEmployeeDirectoryApi.md#readitemsemployeedirectory) | **GET** /items/employee_directory | List Items
*ItemsEmployeeDirectoryApi* | [**readSingleItemsEmployeeDirectory**](docs/ItemsEmployeeDirectoryApi.md#readsingleitemsemployeedirectory) | **GET** /items/employee_directory/{id} | Retrieve an Item
*ItemsEmployeeDirectoryApi* | [**updateItemsEmployeeDirectory**](docs/ItemsEmployeeDirectoryApi.md#updateitemsemployeedirectory) | **PATCH** /items/employee_directory | Update Multiple Items
*ItemsEmployeeDirectoryApi* | [**updateSingleItemsEmployeeDirectory**](docs/ItemsEmployeeDirectoryApi.md#updatesingleitemsemployeedirectory) | **PATCH** /items/employee_directory/{id} | Update an Item
*ItemsEnergyEfficiencyApi* | [**createItemsEnergyEfficiency**](docs/ItemsEnergyEfficiencyApi.md#createitemsenergyefficiency) | **POST** /items/energy_efficiency | Create an Item
*ItemsEnergyEfficiencyApi* | [**deleteItemsEnergyEfficiency**](docs/ItemsEnergyEfficiencyApi.md#deleteitemsenergyefficiency) | **DELETE** /items/energy_efficiency | Delete Multiple Items
*ItemsEnergyEfficiencyApi* | [**deleteSingleItemsEnergyEfficiency**](docs/ItemsEnergyEfficiencyApi.md#deletesingleitemsenergyefficiency) | **DELETE** /items/energy_efficiency/{id} | Delete an Item
*ItemsEnergyEfficiencyApi* | [**readItemsEnergyEfficiency**](docs/ItemsEnergyEfficiencyApi.md#readitemsenergyefficiency) | **GET** /items/energy_efficiency | List Items
*ItemsEnergyEfficiencyApi* | [**readSingleItemsEnergyEfficiency**](docs/ItemsEnergyEfficiencyApi.md#readsingleitemsenergyefficiency) | **GET** /items/energy_efficiency/{id} | Retrieve an Item
*ItemsEnergyEfficiencyApi* | [**updateItemsEnergyEfficiency**](docs/ItemsEnergyEfficiencyApi.md#updateitemsenergyefficiency) | **PATCH** /items/energy_efficiency | Update Multiple Items
*ItemsEnergyEfficiencyApi* | [**updateSingleItemsEnergyEfficiency**](docs/ItemsEnergyEfficiencyApi.md#updatesingleitemsenergyefficiency) | **PATCH** /items/energy_efficiency/{id} | Update an Item
*ItemsEnvironmentalComplianceApi* | [**createItemsEnvironmentalCompliance**](docs/ItemsEnvironmentalComplianceApi.md#createitemsenvironmentalcompliance) | **POST** /items/environmental_compliance | Create an Item
*ItemsEnvironmentalComplianceApi* | [**deleteItemsEnvironmentalCompliance**](docs/ItemsEnvironmentalComplianceApi.md#deleteitemsenvironmentalcompliance) | **DELETE** /items/environmental_compliance | Delete Multiple Items
*ItemsEnvironmentalComplianceApi* | [**deleteSingleItemsEnvironmentalCompliance**](docs/ItemsEnvironmentalComplianceApi.md#deletesingleitemsenvironmentalcompliance) | **DELETE** /items/environmental_compliance/{id} | Delete an Item
*ItemsEnvironmentalComplianceApi* | [**readItemsEnvironmentalCompliance**](docs/ItemsEnvironmentalComplianceApi.md#readitemsenvironmentalcompliance) | **GET** /items/environmental_compliance | List Items
*ItemsEnvironmentalComplianceApi* | [**readSingleItemsEnvironmentalCompliance**](docs/ItemsEnvironmentalComplianceApi.md#readsingleitemsenvironmentalcompliance) | **GET** /items/environmental_compliance/{id} | Retrieve an Item
*ItemsEnvironmentalComplianceApi* | [**updateItemsEnvironmentalCompliance**](docs/ItemsEnvironmentalComplianceApi.md#updateitemsenvironmentalcompliance) | **PATCH** /items/environmental_compliance | Update Multiple Items
*ItemsEnvironmentalComplianceApi* | [**updateSingleItemsEnvironmentalCompliance**](docs/ItemsEnvironmentalComplianceApi.md#updatesingleitemsenvironmentalcompliance) | **PATCH** /items/environmental_compliance/{id} | Update an Item
*ItemsEventsApi* | [**createItemsEvents**](docs/ItemsEventsApi.md#createitemsevents) | **POST** /items/events | Create an Item
*ItemsEventsApi* | [**deleteItemsEvents**](docs/ItemsEventsApi.md#deleteitemsevents) | **DELETE** /items/events | Delete Multiple Items
*ItemsEventsApi* | [**deleteSingleItemsEvents**](docs/ItemsEventsApi.md#deletesingleitemsevents) | **DELETE** /items/events/{id} | Delete an Item
*ItemsEventsApi* | [**readItemsEvents**](docs/ItemsEventsApi.md#readitemsevents) | **GET** /items/events | List Items
*ItemsEventsApi* | [**readSingleItemsEvents**](docs/ItemsEventsApi.md#readsingleitemsevents) | **GET** /items/events/{id} | Retrieve an Item
*ItemsEventsApi* | [**updateItemsEvents**](docs/ItemsEventsApi.md#updateitemsevents) | **PATCH** /items/events | Update Multiple Items
*ItemsEventsApi* | [**updateSingleItemsEvents**](docs/ItemsEventsApi.md#updatesingleitemsevents) | **PATCH** /items/events/{id} | Update an Item
*ItemsExpensesApi* | [**createItemsExpenses**](docs/ItemsExpensesApi.md#createitemsexpenses) | **POST** /items/expenses | Create an Item
*ItemsExpensesApi* | [**deleteItemsExpenses**](docs/ItemsExpensesApi.md#deleteitemsexpenses) | **DELETE** /items/expenses | Delete Multiple Items
*ItemsExpensesApi* | [**deleteSingleItemsExpenses**](docs/ItemsExpensesApi.md#deletesingleitemsexpenses) | **DELETE** /items/expenses/{id} | Delete an Item
*ItemsExpensesApi* | [**readItemsExpenses**](docs/ItemsExpensesApi.md#readitemsexpenses) | **GET** /items/expenses | List Items
*ItemsExpensesApi* | [**readSingleItemsExpenses**](docs/ItemsExpensesApi.md#readsingleitemsexpenses) | **GET** /items/expenses/{id} | Retrieve an Item
*ItemsExpensesApi* | [**updateItemsExpenses**](docs/ItemsExpensesApi.md#updateitemsexpenses) | **PATCH** /items/expenses | Update Multiple Items
*ItemsExpensesApi* | [**updateSingleItemsExpenses**](docs/ItemsExpensesApi.md#updatesingleitemsexpenses) | **PATCH** /items/expenses/{id} | Update an Item
*ItemsFacilitiesApi* | [**createItemsFacilities**](docs/ItemsFacilitiesApi.md#createitemsfacilities) | **POST** /items/facilities | Create an Item
*ItemsFacilitiesApi* | [**deleteItemsFacilities**](docs/ItemsFacilitiesApi.md#deleteitemsfacilities) | **DELETE** /items/facilities | Delete Multiple Items
*ItemsFacilitiesApi* | [**deleteSingleItemsFacilities**](docs/ItemsFacilitiesApi.md#deletesingleitemsfacilities) | **DELETE** /items/facilities/{id} | Delete an Item
*ItemsFacilitiesApi* | [**readItemsFacilities**](docs/ItemsFacilitiesApi.md#readitemsfacilities) | **GET** /items/facilities | List Items
*ItemsFacilitiesApi* | [**readSingleItemsFacilities**](docs/ItemsFacilitiesApi.md#readsingleitemsfacilities) | **GET** /items/facilities/{id} | Retrieve an Item
*ItemsFacilitiesApi* | [**updateItemsFacilities**](docs/ItemsFacilitiesApi.md#updateitemsfacilities) | **PATCH** /items/facilities | Update Multiple Items
*ItemsFacilitiesApi* | [**updateSingleItemsFacilities**](docs/ItemsFacilitiesApi.md#updatesingleitemsfacilities) | **PATCH** /items/facilities/{id} | Update an Item
*ItemsFeedbackApi* | [**createItemsFeedback**](docs/ItemsFeedbackApi.md#createitemsfeedback) | **POST** /items/feedback | Create an Item
*ItemsFeedbackApi* | [**deleteItemsFeedback**](docs/ItemsFeedbackApi.md#deleteitemsfeedback) | **DELETE** /items/feedback | Delete Multiple Items
*ItemsFeedbackApi* | [**deleteSingleItemsFeedback**](docs/ItemsFeedbackApi.md#deletesingleitemsfeedback) | **DELETE** /items/feedback/{id} | Delete an Item
*ItemsFeedbackApi* | [**readItemsFeedback**](docs/ItemsFeedbackApi.md#readitemsfeedback) | **GET** /items/feedback | List Items
*ItemsFeedbackApi* | [**readSingleItemsFeedback**](docs/ItemsFeedbackApi.md#readsingleitemsfeedback) | **GET** /items/feedback/{id} | Retrieve an Item
*ItemsFeedbackApi* | [**updateItemsFeedback**](docs/ItemsFeedbackApi.md#updateitemsfeedback) | **PATCH** /items/feedback | Update Multiple Items
*ItemsFeedbackApi* | [**updateSingleItemsFeedback**](docs/ItemsFeedbackApi.md#updatesingleitemsfeedback) | **PATCH** /items/feedback/{id} | Update an Item
*ItemsForumApi* | [**createItemsForum**](docs/ItemsForumApi.md#createitemsforum) | **POST** /items/forum | Create an Item
*ItemsForumApi* | [**deleteItemsForum**](docs/ItemsForumApi.md#deleteitemsforum) | **DELETE** /items/forum | Delete Multiple Items
*ItemsForumApi* | [**deleteSingleItemsForum**](docs/ItemsForumApi.md#deletesingleitemsforum) | **DELETE** /items/forum/{id} | Delete an Item
*ItemsForumApi* | [**readItemsForum**](docs/ItemsForumApi.md#readitemsforum) | **GET** /items/forum | List Items
*ItemsForumApi* | [**readSingleItemsForum**](docs/ItemsForumApi.md#readsingleitemsforum) | **GET** /items/forum/{id} | Retrieve an Item
*ItemsForumApi* | [**updateItemsForum**](docs/ItemsForumApi.md#updateitemsforum) | **PATCH** /items/forum | Update Multiple Items
*ItemsForumApi* | [**updateSingleItemsForum**](docs/ItemsForumApi.md#updatesingleitemsforum) | **PATCH** /items/forum/{id} | Update an Item
*ItemsFulfillmentApi* | [**createItemsFulfillment**](docs/ItemsFulfillmentApi.md#createitemsfulfillment) | **POST** /items/fulfillment | Create an Item
*ItemsFulfillmentApi* | [**deleteItemsFulfillment**](docs/ItemsFulfillmentApi.md#deleteitemsfulfillment) | **DELETE** /items/fulfillment | Delete Multiple Items
*ItemsFulfillmentApi* | [**deleteSingleItemsFulfillment**](docs/ItemsFulfillmentApi.md#deletesingleitemsfulfillment) | **DELETE** /items/fulfillment/{id} | Delete an Item
*ItemsFulfillmentApi* | [**readItemsFulfillment**](docs/ItemsFulfillmentApi.md#readitemsfulfillment) | **GET** /items/fulfillment | List Items
*ItemsFulfillmentApi* | [**readSingleItemsFulfillment**](docs/ItemsFulfillmentApi.md#readsingleitemsfulfillment) | **GET** /items/fulfillment/{id} | Retrieve an Item
*ItemsFulfillmentApi* | [**updateItemsFulfillment**](docs/ItemsFulfillmentApi.md#updateitemsfulfillment) | **PATCH** /items/fulfillment | Update Multiple Items
*ItemsFulfillmentApi* | [**updateSingleItemsFulfillment**](docs/ItemsFulfillmentApi.md#updatesingleitemsfulfillment) | **PATCH** /items/fulfillment/{id} | Update an Item
*ItemsGovernanceandEthicsApi* | [**createItemsGovernanceandEthics**](docs/ItemsGovernanceandEthicsApi.md#createitemsgovernanceandethics) | **POST** /items/governance_and_ethics | Create an Item
*ItemsGovernanceandEthicsApi* | [**deleteItemsGovernanceandEthics**](docs/ItemsGovernanceandEthicsApi.md#deleteitemsgovernanceandethics) | **DELETE** /items/governance_and_ethics | Delete Multiple Items
*ItemsGovernanceandEthicsApi* | [**deleteSingleItemsGovernanceandEthics**](docs/ItemsGovernanceandEthicsApi.md#deletesingleitemsgovernanceandethics) | **DELETE** /items/governance_and_ethics/{id} | Delete an Item
*ItemsGovernanceandEthicsApi* | [**readItemsGovernanceandEthics**](docs/ItemsGovernanceandEthicsApi.md#readitemsgovernanceandethics) | **GET** /items/governance_and_ethics | List Items
*ItemsGovernanceandEthicsApi* | [**readSingleItemsGovernanceandEthics**](docs/ItemsGovernanceandEthicsApi.md#readsingleitemsgovernanceandethics) | **GET** /items/governance_and_ethics/{id} | Retrieve an Item
*ItemsGovernanceandEthicsApi* | [**updateItemsGovernanceandEthics**](docs/ItemsGovernanceandEthicsApi.md#updateitemsgovernanceandethics) | **PATCH** /items/governance_and_ethics | Update Multiple Items
*ItemsGovernanceandEthicsApi* | [**updateSingleItemsGovernanceandEthics**](docs/ItemsGovernanceandEthicsApi.md#updatesingleitemsgovernanceandethics) | **PATCH** /items/governance_and_ethics/{id} | Update an Item
*ItemsHelpdeskApi* | [**createItemsHelpdesk**](docs/ItemsHelpdeskApi.md#createitemshelpdesk) | **POST** /items/helpdesk | Create an Item
*ItemsHelpdeskApi* | [**deleteItemsHelpdesk**](docs/ItemsHelpdeskApi.md#deleteitemshelpdesk) | **DELETE** /items/helpdesk | Delete Multiple Items
*ItemsHelpdeskApi* | [**deleteSingleItemsHelpdesk**](docs/ItemsHelpdeskApi.md#deletesingleitemshelpdesk) | **DELETE** /items/helpdesk/{id} | Delete an Item
*ItemsHelpdeskApi* | [**readItemsHelpdesk**](docs/ItemsHelpdeskApi.md#readitemshelpdesk) | **GET** /items/helpdesk | List Items
*ItemsHelpdeskApi* | [**readSingleItemsHelpdesk**](docs/ItemsHelpdeskApi.md#readsingleitemshelpdesk) | **GET** /items/helpdesk/{id} | Retrieve an Item
*ItemsHelpdeskApi* | [**updateItemsHelpdesk**](docs/ItemsHelpdeskApi.md#updateitemshelpdesk) | **PATCH** /items/helpdesk | Update Multiple Items
*ItemsHelpdeskApi* | [**updateSingleItemsHelpdesk**](docs/ItemsHelpdeskApi.md#updatesingleitemshelpdesk) | **PATCH** /items/helpdesk/{id} | Update an Item
*ItemsInventoryApi* | [**createItemsInventory**](docs/ItemsInventoryApi.md#createitemsinventory) | **POST** /items/inventory | Create an Item
*ItemsInventoryApi* | [**deleteItemsInventory**](docs/ItemsInventoryApi.md#deleteitemsinventory) | **DELETE** /items/inventory | Delete Multiple Items
*ItemsInventoryApi* | [**deleteSingleItemsInventory**](docs/ItemsInventoryApi.md#deletesingleitemsinventory) | **DELETE** /items/inventory/{id} | Delete an Item
*ItemsInventoryApi* | [**readItemsInventory**](docs/ItemsInventoryApi.md#readitemsinventory) | **GET** /items/inventory | List Items
*ItemsInventoryApi* | [**readSingleItemsInventory**](docs/ItemsInventoryApi.md#readsingleitemsinventory) | **GET** /items/inventory/{id} | Retrieve an Item
*ItemsInventoryApi* | [**updateItemsInventory**](docs/ItemsInventoryApi.md#updateitemsinventory) | **PATCH** /items/inventory | Update Multiple Items
*ItemsInventoryApi* | [**updateSingleItemsInventory**](docs/ItemsInventoryApi.md#updatesingleitemsinventory) | **PATCH** /items/inventory/{id} | Update an Item
*ItemsInvoicesApi* | [**createItemsInvoices**](docs/ItemsInvoicesApi.md#createitemsinvoices) | **POST** /items/invoices | Create an Item
*ItemsInvoicesApi* | [**deleteItemsInvoices**](docs/ItemsInvoicesApi.md#deleteitemsinvoices) | **DELETE** /items/invoices | Delete Multiple Items
*ItemsInvoicesApi* | [**deleteSingleItemsInvoices**](docs/ItemsInvoicesApi.md#deletesingleitemsinvoices) | **DELETE** /items/invoices/{id} | Delete an Item
*ItemsInvoicesApi* | [**readItemsInvoices**](docs/ItemsInvoicesApi.md#readitemsinvoices) | **GET** /items/invoices | List Items
*ItemsInvoicesApi* | [**readSingleItemsInvoices**](docs/ItemsInvoicesApi.md#readsingleitemsinvoices) | **GET** /items/invoices/{id} | Retrieve an Item
*ItemsInvoicesApi* | [**updateItemsInvoices**](docs/ItemsInvoicesApi.md#updateitemsinvoices) | **PATCH** /items/invoices | Update Multiple Items
*ItemsInvoicesApi* | [**updateSingleItemsInvoices**](docs/ItemsInvoicesApi.md#updatesingleitemsinvoices) | **PATCH** /items/invoices/{id} | Update an Item
*ItemsInvoicingApi* | [**createItemsInvoicing**](docs/ItemsInvoicingApi.md#createitemsinvoicing) | **POST** /items/invoicing | Create an Item
*ItemsInvoicingApi* | [**deleteItemsInvoicing**](docs/ItemsInvoicingApi.md#deleteitemsinvoicing) | **DELETE** /items/invoicing | Delete Multiple Items
*ItemsInvoicingApi* | [**deleteSingleItemsInvoicing**](docs/ItemsInvoicingApi.md#deletesingleitemsinvoicing) | **DELETE** /items/invoicing/{id} | Delete an Item
*ItemsInvoicingApi* | [**readItemsInvoicing**](docs/ItemsInvoicingApi.md#readitemsinvoicing) | **GET** /items/invoicing | List Items
*ItemsInvoicingApi* | [**readSingleItemsInvoicing**](docs/ItemsInvoicingApi.md#readsingleitemsinvoicing) | **GET** /items/invoicing/{id} | Retrieve an Item
*ItemsInvoicingApi* | [**updateItemsInvoicing**](docs/ItemsInvoicingApi.md#updateitemsinvoicing) | **PATCH** /items/invoicing | Update Multiple Items
*ItemsInvoicingApi* | [**updateSingleItemsInvoicing**](docs/ItemsInvoicingApi.md#updatesingleitemsinvoicing) | **PATCH** /items/invoicing/{id} | Update an Item
*ItemsLifecycleApi* | [**createItemsLifecycle**](docs/ItemsLifecycleApi.md#createitemslifecycle) | **POST** /items/lifecycle | Create an Item
*ItemsLifecycleApi* | [**deleteItemsLifecycle**](docs/ItemsLifecycleApi.md#deleteitemslifecycle) | **DELETE** /items/lifecycle | Delete Multiple Items
*ItemsLifecycleApi* | [**deleteSingleItemsLifecycle**](docs/ItemsLifecycleApi.md#deletesingleitemslifecycle) | **DELETE** /items/lifecycle/{id} | Delete an Item
*ItemsLifecycleApi* | [**readItemsLifecycle**](docs/ItemsLifecycleApi.md#readitemslifecycle) | **GET** /items/lifecycle | List Items
*ItemsLifecycleApi* | [**readSingleItemsLifecycle**](docs/ItemsLifecycleApi.md#readsingleitemslifecycle) | **GET** /items/lifecycle/{id} | Retrieve an Item
*ItemsLifecycleApi* | [**updateItemsLifecycle**](docs/ItemsLifecycleApi.md#updateitemslifecycle) | **PATCH** /items/lifecycle | Update Multiple Items
*ItemsLifecycleApi* | [**updateSingleItemsLifecycle**](docs/ItemsLifecycleApi.md#updatesingleitemslifecycle) | **PATCH** /items/lifecycle/{id} | Update an Item
*ItemsLiveChatApi* | [**createItemsLiveChat**](docs/ItemsLiveChatApi.md#createitemslivechat) | **POST** /items/live_chat | Create an Item
*ItemsLiveChatApi* | [**deleteItemsLiveChat**](docs/ItemsLiveChatApi.md#deleteitemslivechat) | **DELETE** /items/live_chat | Delete Multiple Items
*ItemsLiveChatApi* | [**deleteSingleItemsLiveChat**](docs/ItemsLiveChatApi.md#deletesingleitemslivechat) | **DELETE** /items/live_chat/{id} | Delete an Item
*ItemsLiveChatApi* | [**readItemsLiveChat**](docs/ItemsLiveChatApi.md#readitemslivechat) | **GET** /items/live_chat | List Items
*ItemsLiveChatApi* | [**readSingleItemsLiveChat**](docs/ItemsLiveChatApi.md#readsingleitemslivechat) | **GET** /items/live_chat/{id} | Retrieve an Item
*ItemsLiveChatApi* | [**updateItemsLiveChat**](docs/ItemsLiveChatApi.md#updateitemslivechat) | **PATCH** /items/live_chat | Update Multiple Items
*ItemsLiveChatApi* | [**updateSingleItemsLiveChat**](docs/ItemsLiveChatApi.md#updatesingleitemslivechat) | **PATCH** /items/live_chat/{id} | Update an Item
*ItemsLoyaltyApi* | [**createItemsLoyalty**](docs/ItemsLoyaltyApi.md#createitemsloyalty) | **POST** /items/loyalty | Create an Item
*ItemsLoyaltyApi* | [**deleteItemsLoyalty**](docs/ItemsLoyaltyApi.md#deleteitemsloyalty) | **DELETE** /items/loyalty | Delete Multiple Items
*ItemsLoyaltyApi* | [**deleteSingleItemsLoyalty**](docs/ItemsLoyaltyApi.md#deletesingleitemsloyalty) | **DELETE** /items/loyalty/{id} | Delete an Item
*ItemsLoyaltyApi* | [**readItemsLoyalty**](docs/ItemsLoyaltyApi.md#readitemsloyalty) | **GET** /items/loyalty | List Items
*ItemsLoyaltyApi* | [**readSingleItemsLoyalty**](docs/ItemsLoyaltyApi.md#readsingleitemsloyalty) | **GET** /items/loyalty/{id} | Retrieve an Item
*ItemsLoyaltyApi* | [**updateItemsLoyalty**](docs/ItemsLoyaltyApi.md#updateitemsloyalty) | **PATCH** /items/loyalty | Update Multiple Items
*ItemsLoyaltyApi* | [**updateSingleItemsLoyalty**](docs/ItemsLoyaltyApi.md#updatesingleitemsloyalty) | **PATCH** /items/loyalty/{id} | Update an Item
*ItemsMaintenanceApi* | [**createItemsMaintenance**](docs/ItemsMaintenanceApi.md#createitemsmaintenance) | **POST** /items/maintenance | Create an Item
*ItemsMaintenanceApi* | [**deleteItemsMaintenance**](docs/ItemsMaintenanceApi.md#deleteitemsmaintenance) | **DELETE** /items/maintenance | Delete Multiple Items
*ItemsMaintenanceApi* | [**deleteSingleItemsMaintenance**](docs/ItemsMaintenanceApi.md#deletesingleitemsmaintenance) | **DELETE** /items/maintenance/{id} | Delete an Item
*ItemsMaintenanceApi* | [**readItemsMaintenance**](docs/ItemsMaintenanceApi.md#readitemsmaintenance) | **GET** /items/maintenance | List Items
*ItemsMaintenanceApi* | [**readSingleItemsMaintenance**](docs/ItemsMaintenanceApi.md#readsingleitemsmaintenance) | **GET** /items/maintenance/{id} | Retrieve an Item
*ItemsMaintenanceApi* | [**updateItemsMaintenance**](docs/ItemsMaintenanceApi.md#updateitemsmaintenance) | **PATCH** /items/maintenance | Update Multiple Items
*ItemsMaintenanceApi* | [**updateSingleItemsMaintenance**](docs/ItemsMaintenanceApi.md#updatesingleitemsmaintenance) | **PATCH** /items/maintenance/{id} | Update an Item
*ItemsPayrollApi* | [**createItemsPayroll**](docs/ItemsPayrollApi.md#createitemspayroll) | **POST** /items/payroll | Create an Item
*ItemsPayrollApi* | [**deleteItemsPayroll**](docs/ItemsPayrollApi.md#deleteitemspayroll) | **DELETE** /items/payroll | Delete Multiple Items
*ItemsPayrollApi* | [**deleteSingleItemsPayroll**](docs/ItemsPayrollApi.md#deletesingleitemspayroll) | **DELETE** /items/payroll/{id} | Delete an Item
*ItemsPayrollApi* | [**readItemsPayroll**](docs/ItemsPayrollApi.md#readitemspayroll) | **GET** /items/payroll | List Items
*ItemsPayrollApi* | [**readSingleItemsPayroll**](docs/ItemsPayrollApi.md#readsingleitemspayroll) | **GET** /items/payroll/{id} | Retrieve an Item
*ItemsPayrollApi* | [**updateItemsPayroll**](docs/ItemsPayrollApi.md#updateitemspayroll) | **PATCH** /items/payroll | Update Multiple Items
*ItemsPayrollApi* | [**updateSingleItemsPayroll**](docs/ItemsPayrollApi.md#updatesingleitemspayroll) | **PATCH** /items/payroll/{id} | Update an Item
*ItemsPerformanceApi* | [**createItemsPerformance**](docs/ItemsPerformanceApi.md#createitemsperformance) | **POST** /items/performance | Create an Item
*ItemsPerformanceApi* | [**deleteItemsPerformance**](docs/ItemsPerformanceApi.md#deleteitemsperformance) | **DELETE** /items/performance | Delete Multiple Items
*ItemsPerformanceApi* | [**deleteSingleItemsPerformance**](docs/ItemsPerformanceApi.md#deletesingleitemsperformance) | **DELETE** /items/performance/{id} | Delete an Item
*ItemsPerformanceApi* | [**readItemsPerformance**](docs/ItemsPerformanceApi.md#readitemsperformance) | **GET** /items/performance | List Items
*ItemsPerformanceApi* | [**readSingleItemsPerformance**](docs/ItemsPerformanceApi.md#readsingleitemsperformance) | **GET** /items/performance/{id} | Retrieve an Item
*ItemsPerformanceApi* | [**updateItemsPerformance**](docs/ItemsPerformanceApi.md#updateitemsperformance) | **PATCH** /items/performance | Update Multiple Items
*ItemsPerformanceApi* | [**updateSingleItemsPerformance**](docs/ItemsPerformanceApi.md#updatesingleitemsperformance) | **PATCH** /items/performance/{id} | Update an Item
*ItemsPointofSaleApi* | [**createItemsPointofSale**](docs/ItemsPointofSaleApi.md#createitemspointofsale) | **POST** /items/point_of_sale | Create an Item
*ItemsPointofSaleApi* | [**deleteItemsPointofSale**](docs/ItemsPointofSaleApi.md#deleteitemspointofsale) | **DELETE** /items/point_of_sale | Delete Multiple Items
*ItemsPointofSaleApi* | [**deleteSingleItemsPointofSale**](docs/ItemsPointofSaleApi.md#deletesingleitemspointofsale) | **DELETE** /items/point_of_sale/{id} | Delete an Item
*ItemsPointofSaleApi* | [**readItemsPointofSale**](docs/ItemsPointofSaleApi.md#readitemspointofsale) | **GET** /items/point_of_sale | List Items
*ItemsPointofSaleApi* | [**readSingleItemsPointofSale**](docs/ItemsPointofSaleApi.md#readsingleitemspointofsale) | **GET** /items/point_of_sale/{id} | Retrieve an Item
*ItemsPointofSaleApi* | [**updateItemsPointofSale**](docs/ItemsPointofSaleApi.md#updateitemspointofsale) | **PATCH** /items/point_of_sale | Update Multiple Items
*ItemsPointofSaleApi* | [**updateSingleItemsPointofSale**](docs/ItemsPointofSaleApi.md#updatesingleitemspointofsale) | **PATCH** /items/point_of_sale/{id} | Update an Item
*ItemsPolicyApi* | [**createItemsPolicy**](docs/ItemsPolicyApi.md#createitemspolicy) | **POST** /items/policy | Create an Item
*ItemsPolicyApi* | [**deleteItemsPolicy**](docs/ItemsPolicyApi.md#deleteitemspolicy) | **DELETE** /items/policy | Delete Multiple Items
*ItemsPolicyApi* | [**deleteSingleItemsPolicy**](docs/ItemsPolicyApi.md#deletesingleitemspolicy) | **DELETE** /items/policy/{id} | Delete an Item
*ItemsPolicyApi* | [**readItemsPolicy**](docs/ItemsPolicyApi.md#readitemspolicy) | **GET** /items/policy | List Items
*ItemsPolicyApi* | [**readSingleItemsPolicy**](docs/ItemsPolicyApi.md#readsingleitemspolicy) | **GET** /items/policy/{id} | Retrieve an Item
*ItemsPolicyApi* | [**updateItemsPolicy**](docs/ItemsPolicyApi.md#updateitemspolicy) | **PATCH** /items/policy | Update Multiple Items
*ItemsPolicyApi* | [**updateSingleItemsPolicy**](docs/ItemsPolicyApi.md#updatesingleitemspolicy) | **PATCH** /items/policy/{id} | Update an Item
*ItemsProcurementApi* | [**createItemsProcurement**](docs/ItemsProcurementApi.md#createitemsprocurement) | **POST** /items/procurement | Create an Item
*ItemsProcurementApi* | [**deleteItemsProcurement**](docs/ItemsProcurementApi.md#deleteitemsprocurement) | **DELETE** /items/procurement | Delete Multiple Items
*ItemsProcurementApi* | [**deleteSingleItemsProcurement**](docs/ItemsProcurementApi.md#deletesingleitemsprocurement) | **DELETE** /items/procurement/{id} | Delete an Item
*ItemsProcurementApi* | [**readItemsProcurement**](docs/ItemsProcurementApi.md#readitemsprocurement) | **GET** /items/procurement | List Items
*ItemsProcurementApi* | [**readSingleItemsProcurement**](docs/ItemsProcurementApi.md#readsingleitemsprocurement) | **GET** /items/procurement/{id} | Retrieve an Item
*ItemsProcurementApi* | [**updateItemsProcurement**](docs/ItemsProcurementApi.md#updateitemsprocurement) | **PATCH** /items/procurement | Update Multiple Items
*ItemsProcurementApi* | [**updateSingleItemsProcurement**](docs/ItemsProcurementApi.md#updatesingleitemsprocurement) | **PATCH** /items/procurement/{id} | Update an Item
*ItemsProductionBatchApi* | [**createItemsProductionBatch**](docs/ItemsProductionBatchApi.md#createitemsproductionbatch) | **POST** /items/production_batch | Create an Item
*ItemsProductionBatchApi* | [**deleteItemsProductionBatch**](docs/ItemsProductionBatchApi.md#deleteitemsproductionbatch) | **DELETE** /items/production_batch | Delete Multiple Items
*ItemsProductionBatchApi* | [**deleteSingleItemsProductionBatch**](docs/ItemsProductionBatchApi.md#deletesingleitemsproductionbatch) | **DELETE** /items/production_batch/{id} | Delete an Item
*ItemsProductionBatchApi* | [**readItemsProductionBatch**](docs/ItemsProductionBatchApi.md#readitemsproductionbatch) | **GET** /items/production_batch | List Items
*ItemsProductionBatchApi* | [**readSingleItemsProductionBatch**](docs/ItemsProductionBatchApi.md#readsingleitemsproductionbatch) | **GET** /items/production_batch/{id} | Retrieve an Item
*ItemsProductionBatchApi* | [**updateItemsProductionBatch**](docs/ItemsProductionBatchApi.md#updateitemsproductionbatch) | **PATCH** /items/production_batch | Update Multiple Items
*ItemsProductionBatchApi* | [**updateSingleItemsProductionBatch**](docs/ItemsProductionBatchApi.md#updatesingleitemsproductionbatch) | **PATCH** /items/production_batch/{id} | Update an Item
*ItemsProjectApi* | [**createItemsProject**](docs/ItemsProjectApi.md#createitemsproject) | **POST** /items/project | Create an Item
*ItemsProjectApi* | [**deleteItemsProject**](docs/ItemsProjectApi.md#deleteitemsproject) | **DELETE** /items/project | Delete Multiple Items
*ItemsProjectApi* | [**deleteSingleItemsProject**](docs/ItemsProjectApi.md#deletesingleitemsproject) | **DELETE** /items/project/{id} | Delete an Item
*ItemsProjectApi* | [**readItemsProject**](docs/ItemsProjectApi.md#readitemsproject) | **GET** /items/project | List Items
*ItemsProjectApi* | [**readSingleItemsProject**](docs/ItemsProjectApi.md#readsingleitemsproject) | **GET** /items/project/{id} | Retrieve an Item
*ItemsProjectApi* | [**updateItemsProject**](docs/ItemsProjectApi.md#updateitemsproject) | **PATCH** /items/project | Update Multiple Items
*ItemsProjectApi* | [**updateSingleItemsProject**](docs/ItemsProjectApi.md#updatesingleitemsproject) | **PATCH** /items/project/{id} | Update an Item
*ItemsPurchaseOrdersApi* | [**createItemsPurchaseOrders**](docs/ItemsPurchaseOrdersApi.md#createitemspurchaseorders) | **POST** /items/purchase_orders | Create an Item
*ItemsPurchaseOrdersApi* | [**deleteItemsPurchaseOrders**](docs/ItemsPurchaseOrdersApi.md#deleteitemspurchaseorders) | **DELETE** /items/purchase_orders | Delete Multiple Items
*ItemsPurchaseOrdersApi* | [**deleteSingleItemsPurchaseOrders**](docs/ItemsPurchaseOrdersApi.md#deletesingleitemspurchaseorders) | **DELETE** /items/purchase_orders/{id} | Delete an Item
*ItemsPurchaseOrdersApi* | [**readItemsPurchaseOrders**](docs/ItemsPurchaseOrdersApi.md#readitemspurchaseorders) | **GET** /items/purchase_orders | List Items
*ItemsPurchaseOrdersApi* | [**readSingleItemsPurchaseOrders**](docs/ItemsPurchaseOrdersApi.md#readsingleitemspurchaseorders) | **GET** /items/purchase_orders/{id} | Retrieve an Item
*ItemsPurchaseOrdersApi* | [**updateItemsPurchaseOrders**](docs/ItemsPurchaseOrdersApi.md#updateitemspurchaseorders) | **PATCH** /items/purchase_orders | Update Multiple Items
*ItemsPurchaseOrdersApi* | [**updateSingleItemsPurchaseOrders**](docs/ItemsPurchaseOrdersApi.md#updatesingleitemspurchaseorders) | **PATCH** /items/purchase_orders/{id} | Update an Item
*ItemsQualityCheckApi* | [**createItemsQualityCheck**](docs/ItemsQualityCheckApi.md#createitemsqualitycheck) | **POST** /items/quality_check | Create an Item
*ItemsQualityCheckApi* | [**deleteItemsQualityCheck**](docs/ItemsQualityCheckApi.md#deleteitemsqualitycheck) | **DELETE** /items/quality_check | Delete Multiple Items
*ItemsQualityCheckApi* | [**deleteSingleItemsQualityCheck**](docs/ItemsQualityCheckApi.md#deletesingleitemsqualitycheck) | **DELETE** /items/quality_check/{id} | Delete an Item
*ItemsQualityCheckApi* | [**readItemsQualityCheck**](docs/ItemsQualityCheckApi.md#readitemsqualitycheck) | **GET** /items/quality_check | List Items
*ItemsQualityCheckApi* | [**readSingleItemsQualityCheck**](docs/ItemsQualityCheckApi.md#readsingleitemsqualitycheck) | **GET** /items/quality_check/{id} | Retrieve an Item
*ItemsQualityCheckApi* | [**updateItemsQualityCheck**](docs/ItemsQualityCheckApi.md#updateitemsqualitycheck) | **PATCH** /items/quality_check | Update Multiple Items
*ItemsQualityCheckApi* | [**updateSingleItemsQualityCheck**](docs/ItemsQualityCheckApi.md#updatesingleitemsqualitycheck) | **PATCH** /items/quality_check/{id} | Update an Item
*ItemsQuotesApi* | [**createItemsQuotes**](docs/ItemsQuotesApi.md#createitemsquotes) | **POST** /items/quotes | Create an Item
*ItemsQuotesApi* | [**deleteItemsQuotes**](docs/ItemsQuotesApi.md#deleteitemsquotes) | **DELETE** /items/quotes | Delete Multiple Items
*ItemsQuotesApi* | [**deleteSingleItemsQuotes**](docs/ItemsQuotesApi.md#deletesingleitemsquotes) | **DELETE** /items/quotes/{id} | Delete an Item
*ItemsQuotesApi* | [**readItemsQuotes**](docs/ItemsQuotesApi.md#readitemsquotes) | **GET** /items/quotes | List Items
*ItemsQuotesApi* | [**readSingleItemsQuotes**](docs/ItemsQuotesApi.md#readsingleitemsquotes) | **GET** /items/quotes/{id} | Retrieve an Item
*ItemsQuotesApi* | [**updateItemsQuotes**](docs/ItemsQuotesApi.md#updateitemsquotes) | **PATCH** /items/quotes | Update Multiple Items
*ItemsQuotesApi* | [**updateSingleItemsQuotes**](docs/ItemsQuotesApi.md#updatesingleitemsquotes) | **PATCH** /items/quotes/{id} | Update an Item
*ItemsRecruitApi* | [**createItemsRecruit**](docs/ItemsRecruitApi.md#createitemsrecruit) | **POST** /items/recruit | Create an Item
*ItemsRecruitApi* | [**deleteItemsRecruit**](docs/ItemsRecruitApi.md#deleteitemsrecruit) | **DELETE** /items/recruit | Delete Multiple Items
*ItemsRecruitApi* | [**deleteSingleItemsRecruit**](docs/ItemsRecruitApi.md#deletesingleitemsrecruit) | **DELETE** /items/recruit/{id} | Delete an Item
*ItemsRecruitApi* | [**readItemsRecruit**](docs/ItemsRecruitApi.md#readitemsrecruit) | **GET** /items/recruit | List Items
*ItemsRecruitApi* | [**readSingleItemsRecruit**](docs/ItemsRecruitApi.md#readsingleitemsrecruit) | **GET** /items/recruit/{id} | Retrieve an Item
*ItemsRecruitApi* | [**updateItemsRecruit**](docs/ItemsRecruitApi.md#updateitemsrecruit) | **PATCH** /items/recruit | Update Multiple Items
*ItemsRecruitApi* | [**updateSingleItemsRecruit**](docs/ItemsRecruitApi.md#updatesingleitemsrecruit) | **PATCH** /items/recruit/{id} | Update an Item
*ItemsRegulationsApi* | [**createItemsRegulations**](docs/ItemsRegulationsApi.md#createitemsregulations) | **POST** /items/regulations | Create an Item
*ItemsRegulationsApi* | [**deleteItemsRegulations**](docs/ItemsRegulationsApi.md#deleteitemsregulations) | **DELETE** /items/regulations | Delete Multiple Items
*ItemsRegulationsApi* | [**deleteSingleItemsRegulations**](docs/ItemsRegulationsApi.md#deletesingleitemsregulations) | **DELETE** /items/regulations/{id} | Delete an Item
*ItemsRegulationsApi* | [**readItemsRegulations**](docs/ItemsRegulationsApi.md#readitemsregulations) | **GET** /items/regulations | List Items
*ItemsRegulationsApi* | [**readSingleItemsRegulations**](docs/ItemsRegulationsApi.md#readsingleitemsregulations) | **GET** /items/regulations/{id} | Retrieve an Item
*ItemsRegulationsApi* | [**updateItemsRegulations**](docs/ItemsRegulationsApi.md#updateitemsregulations) | **PATCH** /items/regulations | Update Multiple Items
*ItemsRegulationsApi* | [**updateSingleItemsRegulations**](docs/ItemsRegulationsApi.md#updatesingleitemsregulations) | **PATCH** /items/regulations/{id} | Update an Item
*ItemsRentalsApi* | [**createItemsRentals**](docs/ItemsRentalsApi.md#createitemsrentals) | **POST** /items/rentals | Create an Item
*ItemsRentalsApi* | [**deleteItemsRentals**](docs/ItemsRentalsApi.md#deleteitemsrentals) | **DELETE** /items/rentals | Delete Multiple Items
*ItemsRentalsApi* | [**deleteSingleItemsRentals**](docs/ItemsRentalsApi.md#deletesingleitemsrentals) | **DELETE** /items/rentals/{id} | Delete an Item
*ItemsRentalsApi* | [**readItemsRentals**](docs/ItemsRentalsApi.md#readitemsrentals) | **GET** /items/rentals | List Items
*ItemsRentalsApi* | [**readSingleItemsRentals**](docs/ItemsRentalsApi.md#readsingleitemsrentals) | **GET** /items/rentals/{id} | Retrieve an Item
*ItemsRentalsApi* | [**updateItemsRentals**](docs/ItemsRentalsApi.md#updateitemsrentals) | **PATCH** /items/rentals | Update Multiple Items
*ItemsRentalsApi* | [**updateSingleItemsRentals**](docs/ItemsRentalsApi.md#updatesingleitemsrentals) | **PATCH** /items/rentals/{id} | Update an Item
*ItemsShipmentApi* | [**createItemsShipment**](docs/ItemsShipmentApi.md#createitemsshipment) | **POST** /items/shipment | Create an Item
*ItemsShipmentApi* | [**deleteItemsShipment**](docs/ItemsShipmentApi.md#deleteitemsshipment) | **DELETE** /items/shipment | Delete Multiple Items
*ItemsShipmentApi* | [**deleteSingleItemsShipment**](docs/ItemsShipmentApi.md#deletesingleitemsshipment) | **DELETE** /items/shipment/{id} | Delete an Item
*ItemsShipmentApi* | [**readItemsShipment**](docs/ItemsShipmentApi.md#readitemsshipment) | **GET** /items/shipment | List Items
*ItemsShipmentApi* | [**readSingleItemsShipment**](docs/ItemsShipmentApi.md#readsingleitemsshipment) | **GET** /items/shipment/{id} | Retrieve an Item
*ItemsShipmentApi* | [**updateItemsShipment**](docs/ItemsShipmentApi.md#updateitemsshipment) | **PATCH** /items/shipment | Update Multiple Items
*ItemsShipmentApi* | [**updateSingleItemsShipment**](docs/ItemsShipmentApi.md#updatesingleitemsshipment) | **PATCH** /items/shipment/{id} | Update an Item
*ItemsSocialMediaApi* | [**createItemsSocialMedia**](docs/ItemsSocialMediaApi.md#createitemssocialmedia) | **POST** /items/social_media | Create an Item
*ItemsSocialMediaApi* | [**deleteItemsSocialMedia**](docs/ItemsSocialMediaApi.md#deleteitemssocialmedia) | **DELETE** /items/social_media | Delete Multiple Items
*ItemsSocialMediaApi* | [**deleteSingleItemsSocialMedia**](docs/ItemsSocialMediaApi.md#deletesingleitemssocialmedia) | **DELETE** /items/social_media/{id} | Delete an Item
*ItemsSocialMediaApi* | [**readItemsSocialMedia**](docs/ItemsSocialMediaApi.md#readitemssocialmedia) | **GET** /items/social_media | List Items
*ItemsSocialMediaApi* | [**readSingleItemsSocialMedia**](docs/ItemsSocialMediaApi.md#readsingleitemssocialmedia) | **GET** /items/social_media/{id} | Retrieve an Item
*ItemsSocialMediaApi* | [**updateItemsSocialMedia**](docs/ItemsSocialMediaApi.md#updateitemssocialmedia) | **PATCH** /items/social_media | Update Multiple Items
*ItemsSocialMediaApi* | [**updateSingleItemsSocialMedia**](docs/ItemsSocialMediaApi.md#updatesingleitemssocialmedia) | **PATCH** /items/social_media/{id} | Update an Item
*ItemsSocialResponsibilityApi* | [**createItemsSocialResponsibility**](docs/ItemsSocialResponsibilityApi.md#createitemssocialresponsibility) | **POST** /items/social_responsibility | Create an Item
*ItemsSocialResponsibilityApi* | [**deleteItemsSocialResponsibility**](docs/ItemsSocialResponsibilityApi.md#deleteitemssocialresponsibility) | **DELETE** /items/social_responsibility | Delete Multiple Items
*ItemsSocialResponsibilityApi* | [**deleteSingleItemsSocialResponsibility**](docs/ItemsSocialResponsibilityApi.md#deletesingleitemssocialresponsibility) | **DELETE** /items/social_responsibility/{id} | Delete an Item
*ItemsSocialResponsibilityApi* | [**readItemsSocialResponsibility**](docs/ItemsSocialResponsibilityApi.md#readitemssocialresponsibility) | **GET** /items/social_responsibility | List Items
*ItemsSocialResponsibilityApi* | [**readSingleItemsSocialResponsibility**](docs/ItemsSocialResponsibilityApi.md#readsingleitemssocialresponsibility) | **GET** /items/social_responsibility/{id} | Retrieve an Item
*ItemsSocialResponsibilityApi* | [**updateItemsSocialResponsibility**](docs/ItemsSocialResponsibilityApi.md#updateitemssocialresponsibility) | **PATCH** /items/social_responsibility | Update Multiple Items
*ItemsSocialResponsibilityApi* | [**updateSingleItemsSocialResponsibility**](docs/ItemsSocialResponsibilityApi.md#updatesingleitemssocialresponsibility) | **PATCH** /items/social_responsibility/{id} | Update an Item
*ItemsSuppliersApi* | [**createItemsSuppliers**](docs/ItemsSuppliersApi.md#createitemssuppliers) | **POST** /items/suppliers | Create an Item
*ItemsSuppliersApi* | [**deleteItemsSuppliers**](docs/ItemsSuppliersApi.md#deleteitemssuppliers) | **DELETE** /items/suppliers | Delete Multiple Items
*ItemsSuppliersApi* | [**deleteSingleItemsSuppliers**](docs/ItemsSuppliersApi.md#deletesingleitemssuppliers) | **DELETE** /items/suppliers/{id} | Delete an Item
*ItemsSuppliersApi* | [**readItemsSuppliers**](docs/ItemsSuppliersApi.md#readitemssuppliers) | **GET** /items/suppliers | List Items
*ItemsSuppliersApi* | [**readSingleItemsSuppliers**](docs/ItemsSuppliersApi.md#readsingleitemssuppliers) | **GET** /items/suppliers/{id} | Retrieve an Item
*ItemsSuppliersApi* | [**updateItemsSuppliers**](docs/ItemsSuppliersApi.md#updateitemssuppliers) | **PATCH** /items/suppliers | Update Multiple Items
*ItemsSuppliersApi* | [**updateSingleItemsSuppliers**](docs/ItemsSuppliersApi.md#updatesingleitemssuppliers) | **PATCH** /items/suppliers/{id} | Update an Item
*ItemsSurveysApi* | [**createItemsSurveys**](docs/ItemsSurveysApi.md#createitemssurveys) | **POST** /items/surveys | Create an Item
*ItemsSurveysApi* | [**deleteItemsSurveys**](docs/ItemsSurveysApi.md#deleteitemssurveys) | **DELETE** /items/surveys | Delete Multiple Items
*ItemsSurveysApi* | [**deleteSingleItemsSurveys**](docs/ItemsSurveysApi.md#deletesingleitemssurveys) | **DELETE** /items/surveys/{id} | Delete an Item
*ItemsSurveysApi* | [**readItemsSurveys**](docs/ItemsSurveysApi.md#readitemssurveys) | **GET** /items/surveys | List Items
*ItemsSurveysApi* | [**readSingleItemsSurveys**](docs/ItemsSurveysApi.md#readsingleitemssurveys) | **GET** /items/surveys/{id} | Retrieve an Item
*ItemsSurveysApi* | [**updateItemsSurveys**](docs/ItemsSurveysApi.md#updateitemssurveys) | **PATCH** /items/surveys | Update Multiple Items
*ItemsSurveysApi* | [**updateSingleItemsSurveys**](docs/ItemsSurveysApi.md#updatesingleitemssurveys) | **PATCH** /items/surveys/{id} | Update an Item
*ItemsSustainableSupplyChainApi* | [**createItemsSustainableSupplyChain**](docs/ItemsSustainableSupplyChainApi.md#createitemssustainablesupplychain) | **POST** /items/sustainable_supply_chain | Create an Item
*ItemsSustainableSupplyChainApi* | [**deleteItemsSustainableSupplyChain**](docs/ItemsSustainableSupplyChainApi.md#deleteitemssustainablesupplychain) | **DELETE** /items/sustainable_supply_chain | Delete Multiple Items
*ItemsSustainableSupplyChainApi* | [**deleteSingleItemsSustainableSupplyChain**](docs/ItemsSustainableSupplyChainApi.md#deletesingleitemssustainablesupplychain) | **DELETE** /items/sustainable_supply_chain/{id} | Delete an Item
*ItemsSustainableSupplyChainApi* | [**readItemsSustainableSupplyChain**](docs/ItemsSustainableSupplyChainApi.md#readitemssustainablesupplychain) | **GET** /items/sustainable_supply_chain | List Items
*ItemsSustainableSupplyChainApi* | [**readSingleItemsSustainableSupplyChain**](docs/ItemsSustainableSupplyChainApi.md#readsingleitemssustainablesupplychain) | **GET** /items/sustainable_supply_chain/{id} | Retrieve an Item
*ItemsSustainableSupplyChainApi* | [**updateItemsSustainableSupplyChain**](docs/ItemsSustainableSupplyChainApi.md#updateitemssustainablesupplychain) | **PATCH** /items/sustainable_supply_chain | Update Multiple Items
*ItemsSustainableSupplyChainApi* | [**updateSingleItemsSustainableSupplyChain**](docs/ItemsSustainableSupplyChainApi.md#updatesingleitemssustainablesupplychain) | **PATCH** /items/sustainable_supply_chain/{id} | Update an Item
*ItemsTaxesApi* | [**createItemsTaxes**](docs/ItemsTaxesApi.md#createitemstaxes) | **POST** /items/taxes | Create an Item
*ItemsTaxesApi* | [**deleteItemsTaxes**](docs/ItemsTaxesApi.md#deleteitemstaxes) | **DELETE** /items/taxes | Delete Multiple Items
*ItemsTaxesApi* | [**deleteSingleItemsTaxes**](docs/ItemsTaxesApi.md#deletesingleitemstaxes) | **DELETE** /items/taxes/{id} | Delete an Item
*ItemsTaxesApi* | [**readItemsTaxes**](docs/ItemsTaxesApi.md#readitemstaxes) | **GET** /items/taxes | List Items
*ItemsTaxesApi* | [**readSingleItemsTaxes**](docs/ItemsTaxesApi.md#readsingleitemstaxes) | **GET** /items/taxes/{id} | Retrieve an Item
*ItemsTaxesApi* | [**updateItemsTaxes**](docs/ItemsTaxesApi.md#updateitemstaxes) | **PATCH** /items/taxes | Update Multiple Items
*ItemsTaxesApi* | [**updateSingleItemsTaxes**](docs/ItemsTaxesApi.md#updatesingleitemstaxes) | **PATCH** /items/taxes/{id} | Update an Item
*ItemsTrainingApi* | [**createItemsTraining**](docs/ItemsTrainingApi.md#createitemstraining) | **POST** /items/training | Create an Item
*ItemsTrainingApi* | [**deleteItemsTraining**](docs/ItemsTrainingApi.md#deleteitemstraining) | **DELETE** /items/training | Delete Multiple Items
*ItemsTrainingApi* | [**deleteSingleItemsTraining**](docs/ItemsTrainingApi.md#deletesingleitemstraining) | **DELETE** /items/training/{id} | Delete an Item
*ItemsTrainingApi* | [**readItemsTraining**](docs/ItemsTrainingApi.md#readitemstraining) | **GET** /items/training | List Items
*ItemsTrainingApi* | [**readSingleItemsTraining**](docs/ItemsTrainingApi.md#readsingleitemstraining) | **GET** /items/training/{id} | Retrieve an Item
*ItemsTrainingApi* | [**updateItemsTraining**](docs/ItemsTrainingApi.md#updateitemstraining) | **PATCH** /items/training | Update Multiple Items
*ItemsTrainingApi* | [**updateSingleItemsTraining**](docs/ItemsTrainingApi.md#updatesingleitemstraining) | **PATCH** /items/training/{id} | Update an Item
*ItemsTransactionsApi* | [**createItemsTransactions**](docs/ItemsTransactionsApi.md#createitemstransactions) | **POST** /items/transactions | Create an Item
*ItemsTransactionsApi* | [**deleteItemsTransactions**](docs/ItemsTransactionsApi.md#deleteitemstransactions) | **DELETE** /items/transactions | Delete Multiple Items
*ItemsTransactionsApi* | [**deleteSingleItemsTransactions**](docs/ItemsTransactionsApi.md#deletesingleitemstransactions) | **DELETE** /items/transactions/{id} | Delete an Item
*ItemsTransactionsApi* | [**readItemsTransactions**](docs/ItemsTransactionsApi.md#readitemstransactions) | **GET** /items/transactions | List Items
*ItemsTransactionsApi* | [**readSingleItemsTransactions**](docs/ItemsTransactionsApi.md#readsingleitemstransactions) | **GET** /items/transactions/{id} | Retrieve an Item
*ItemsTransactionsApi* | [**updateItemsTransactions**](docs/ItemsTransactionsApi.md#updateitemstransactions) | **PATCH** /items/transactions | Update Multiple Items
*ItemsTransactionsApi* | [**updateSingleItemsTransactions**](docs/ItemsTransactionsApi.md#updatesingleitemstransactions) | **PATCH** /items/transactions/{id} | Update an Item
*PermissionsApi* | [**getMyPermissions**](docs/PermissionsApi.md#getmypermissions) | **GET** /permissions/me | List My Permissions
*PermissionsApi* | [**getPermission**](docs/PermissionsApi.md#getpermission) | **GET** /permissions/{id} | Retrieve a Permission
*PermissionsApi* | [**getPermissions**](docs/PermissionsApi.md#getpermissions) | **GET** /permissions | List Permissions
*PresetsApi* | [**createPreset**](docs/PresetsApi.md#createpreset) | **POST** /presets | Create a Preset
*PresetsApi* | [**deletePreset**](docs/PresetsApi.md#deletepreset) | **DELETE** /presets/{id} | Delete a Preset
*PresetsApi* | [**deletePresets**](docs/PresetsApi.md#deletepresets) | **DELETE** /presets | Delete Multiple Presets
*PresetsApi* | [**getPreset**](docs/PresetsApi.md#getpreset) | **GET** /presets/{id} | Retrieve a Preset
*PresetsApi* | [**getPresets**](docs/PresetsApi.md#getpresets) | **GET** /presets | List Presets
*PresetsApi* | [**updatePreset**](docs/PresetsApi.md#updatepreset) | **PATCH** /presets/{id} | Update a Preset
*PresetsApi* | [**updatePresets**](docs/PresetsApi.md#updatepresets) | **PATCH** /presets | Update Multiple Presets
*RelationsApi* | [**getRelation**](docs/RelationsApi.md#getrelation) | **GET** /relations/{id} | Retrieve a Relation
*RelationsApi* | [**getRelations**](docs/RelationsApi.md#getrelations) | **GET** /relations | List Relations
*RolesApi* | [**getRole**](docs/RolesApi.md#getrole) | **GET** /roles/{id} | Retrieve a Role
*RolesApi* | [**getRoles**](docs/RolesApi.md#getroles) | **GET** /roles | List Roles
*SchemaApi* | [**schemaApply**](docs/SchemaApi.md#schemaapply) | **POST** /schema/apply | Apply Schema Difference
*SchemaApi* | [**schemaDiff**](docs/SchemaApi.md#schemadiff) | **POST** /schema/diff | Retrieve Schema Difference
*SchemaApi* | [**schemaSnapshot**](docs/SchemaApi.md#schemasnapshot) | **GET** /schema/snapshot | Retrieve Schema Snapshot
*ServerApi* | [**ping**](docs/ServerApi.md#ping) | **GET** /server/ping | Ping
*ServerApi* | [**serverInfo**](docs/ServerApi.md#serverinfo) | **GET** /server/info | System Info
*SettingsApi* | [**getSettings**](docs/SettingsApi.md#getsettings) | **GET** /settings | Retrieve Settings
*UsersApi* | [**getMe**](docs/UsersApi.md#getme) | **GET** /users/me | Retrieve Current User
*UsersApi* | [**getUser**](docs/UsersApi.md#getuser) | **GET** /users/{id} | Retrieve a User
*UsersApi* | [**getUsers**](docs/UsersApi.md#getusers) | **GET** /users | List Users
*UsersApi* | [**updateLastUsedPageMe**](docs/UsersApi.md#updatelastusedpageme) | **PATCH** /users/me/track/page | Update Last Page
*UsersApi* | [**updateMe**](docs/UsersApi.md#updateme) | **PATCH** /users/me | Update Current User
*UsersApi* | [**updateUser**](docs/UsersApi.md#updateuser) | **PATCH** /users/{id} | Update a User
*UsersApi* | [**updateUsers**](docs/UsersApi.md#updateusers) | **PATCH** /users | Update Multiple Users
*UtilitiesApi* | [**clearCache**](docs/UtilitiesApi.md#clearcache) | **POST** /utils/cache/clear | Clear Cache
*UtilitiesApi* | [**export**](docs/UtilitiesApi.md#export) | **POST** /utils/export/{collection} | Export Items
*UtilitiesApi* | [**hashGenerate**](docs/UtilitiesApi.md#hashgenerate) | **POST** /utils/hash/generate | Hash a string
*UtilitiesApi* | [**hashVerify**](docs/UtilitiesApi.md#hashverify) | **POST** /utils/hash/verify | Hash a string
*UtilitiesApi* | [**import**](docs/UtilitiesApi.md#import) | **POST** /utils/import/{collection} | Import Items
*UtilitiesApi* | [**random**](docs/UtilitiesApi.md#random) | **GET** /utils/random/string | Get a Random String
*UtilitiesApi* | [**sort**](docs/UtilitiesApi.md#sort) | **POST** /utils/sort/{collection} | Sort Items


## Documentation For Models

 - [Activity](docs/Activity.md)
 - [ActivityCollection](docs/ActivityCollection.md)
 - [ActivityIp](docs/ActivityIp.md)
 - [ActivityUser](docs/ActivityUser.md)
 - [Collections](docs/Collections.md)
 - [CollectionsGroup](docs/CollectionsGroup.md)
 - [CreateComment200Response](docs/CreateComment200Response.md)
 - [CreateCommentRequest](docs/CreateCommentRequest.md)
 - [CreateFile200Response](docs/CreateFile200Response.md)
 - [CreateFileRequest](docs/CreateFileRequest.md)
 - [CreateFolder200Response](docs/CreateFolder200Response.md)
 - [CreateFolderRequest](docs/CreateFolderRequest.md)
 - [CreateItemsAccounts200Response](docs/CreateItemsAccounts200Response.md)
 - [CreateItemsAccountsRequest](docs/CreateItemsAccountsRequest.md)
 - [CreateItemsAppointments200Response](docs/CreateItemsAppointments200Response.md)
 - [CreateItemsAppointmentsRequest](docs/CreateItemsAppointmentsRequest.md)
 - [CreateItemsBudgets200Response](docs/CreateItemsBudgets200Response.md)
 - [CreateItemsBudgetsRequest](docs/CreateItemsBudgetsRequest.md)
 - [CreateItemsCampaigns200Response](docs/CreateItemsCampaigns200Response.md)
 - [CreateItemsCampaignsRequest](docs/CreateItemsCampaignsRequest.md)
 - [CreateItemsCarbonFootprint200Response](docs/CreateItemsCarbonFootprint200Response.md)
 - [CreateItemsCarbonFootprintRequest](docs/CreateItemsCarbonFootprintRequest.md)
 - [CreateItemsCompanyAssets200Response](docs/CreateItemsCompanyAssets200Response.md)
 - [CreateItemsCompanyAssetsRequest](docs/CreateItemsCompanyAssetsRequest.md)
 - [CreateItemsContent200Response](docs/CreateItemsContent200Response.md)
 - [CreateItemsContentRequest](docs/CreateItemsContentRequest.md)
 - [CreateItemsContracts200Response](docs/CreateItemsContracts200Response.md)
 - [CreateItemsContractsRequest](docs/CreateItemsContractsRequest.md)
 - [CreateItemsCrm200Response](docs/CreateItemsCrm200Response.md)
 - [CreateItemsCrmRequest](docs/CreateItemsCrmRequest.md)
 - [CreateItemsDepartment200Response](docs/CreateItemsDepartment200Response.md)
 - [CreateItemsDepartmentRequest](docs/CreateItemsDepartmentRequest.md)
 - [CreateItemsDistribution200Response](docs/CreateItemsDistribution200Response.md)
 - [CreateItemsDistributionRequest](docs/CreateItemsDistributionRequest.md)
 - [CreateItemsEmailCampaigns200Response](docs/CreateItemsEmailCampaigns200Response.md)
 - [CreateItemsEmailCampaignsRequest](docs/CreateItemsEmailCampaignsRequest.md)
 - [CreateItemsEmployeeDirectory200Response](docs/CreateItemsEmployeeDirectory200Response.md)
 - [CreateItemsEmployeeDirectoryRequest](docs/CreateItemsEmployeeDirectoryRequest.md)
 - [CreateItemsEnergyEfficiency200Response](docs/CreateItemsEnergyEfficiency200Response.md)
 - [CreateItemsEnergyEfficiencyRequest](docs/CreateItemsEnergyEfficiencyRequest.md)
 - [CreateItemsEnvironmentalCompliance200Response](docs/CreateItemsEnvironmentalCompliance200Response.md)
 - [CreateItemsEnvironmentalComplianceRequest](docs/CreateItemsEnvironmentalComplianceRequest.md)
 - [CreateItemsEvents200Response](docs/CreateItemsEvents200Response.md)
 - [CreateItemsEventsRequest](docs/CreateItemsEventsRequest.md)
 - [CreateItemsExpenses200Response](docs/CreateItemsExpenses200Response.md)
 - [CreateItemsExpensesRequest](docs/CreateItemsExpensesRequest.md)
 - [CreateItemsFacilities200Response](docs/CreateItemsFacilities200Response.md)
 - [CreateItemsFacilitiesRequest](docs/CreateItemsFacilitiesRequest.md)
 - [CreateItemsFeedback200Response](docs/CreateItemsFeedback200Response.md)
 - [CreateItemsFeedbackRequest](docs/CreateItemsFeedbackRequest.md)
 - [CreateItemsForum200Response](docs/CreateItemsForum200Response.md)
 - [CreateItemsForumRequest](docs/CreateItemsForumRequest.md)
 - [CreateItemsFulfillment200Response](docs/CreateItemsFulfillment200Response.md)
 - [CreateItemsFulfillmentRequest](docs/CreateItemsFulfillmentRequest.md)
 - [CreateItemsGovernanceandEthics200Response](docs/CreateItemsGovernanceandEthics200Response.md)
 - [CreateItemsGovernanceandEthicsRequest](docs/CreateItemsGovernanceandEthicsRequest.md)
 - [CreateItemsHelpdesk200Response](docs/CreateItemsHelpdesk200Response.md)
 - [CreateItemsHelpdeskRequest](docs/CreateItemsHelpdeskRequest.md)
 - [CreateItemsInventory200Response](docs/CreateItemsInventory200Response.md)
 - [CreateItemsInventoryRequest](docs/CreateItemsInventoryRequest.md)
 - [CreateItemsInvoices200Response](docs/CreateItemsInvoices200Response.md)
 - [CreateItemsInvoicesRequest](docs/CreateItemsInvoicesRequest.md)
 - [CreateItemsInvoicing200Response](docs/CreateItemsInvoicing200Response.md)
 - [CreateItemsInvoicingRequest](docs/CreateItemsInvoicingRequest.md)
 - [CreateItemsLifecycle200Response](docs/CreateItemsLifecycle200Response.md)
 - [CreateItemsLifecycleRequest](docs/CreateItemsLifecycleRequest.md)
 - [CreateItemsLiveChat200Response](docs/CreateItemsLiveChat200Response.md)
 - [CreateItemsLiveChatRequest](docs/CreateItemsLiveChatRequest.md)
 - [CreateItemsLoyalty200Response](docs/CreateItemsLoyalty200Response.md)
 - [CreateItemsLoyaltyRequest](docs/CreateItemsLoyaltyRequest.md)
 - [CreateItemsMaintenance200Response](docs/CreateItemsMaintenance200Response.md)
 - [CreateItemsMaintenanceRequest](docs/CreateItemsMaintenanceRequest.md)
 - [CreateItemsPayroll200Response](docs/CreateItemsPayroll200Response.md)
 - [CreateItemsPayrollRequest](docs/CreateItemsPayrollRequest.md)
 - [CreateItemsPerformance200Response](docs/CreateItemsPerformance200Response.md)
 - [CreateItemsPerformanceRequest](docs/CreateItemsPerformanceRequest.md)
 - [CreateItemsPointofSale200Response](docs/CreateItemsPointofSale200Response.md)
 - [CreateItemsPointofSaleRequest](docs/CreateItemsPointofSaleRequest.md)
 - [CreateItemsPolicy200Response](docs/CreateItemsPolicy200Response.md)
 - [CreateItemsPolicyRequest](docs/CreateItemsPolicyRequest.md)
 - [CreateItemsProcurement200Response](docs/CreateItemsProcurement200Response.md)
 - [CreateItemsProcurementRequest](docs/CreateItemsProcurementRequest.md)
 - [CreateItemsProductionBatch200Response](docs/CreateItemsProductionBatch200Response.md)
 - [CreateItemsProductionBatchRequest](docs/CreateItemsProductionBatchRequest.md)
 - [CreateItemsProject200Response](docs/CreateItemsProject200Response.md)
 - [CreateItemsProjectRequest](docs/CreateItemsProjectRequest.md)
 - [CreateItemsPurchaseOrders200Response](docs/CreateItemsPurchaseOrders200Response.md)
 - [CreateItemsPurchaseOrdersRequest](docs/CreateItemsPurchaseOrdersRequest.md)
 - [CreateItemsQualityCheck200Response](docs/CreateItemsQualityCheck200Response.md)
 - [CreateItemsQualityCheckRequest](docs/CreateItemsQualityCheckRequest.md)
 - [CreateItemsQuotes200Response](docs/CreateItemsQuotes200Response.md)
 - [CreateItemsQuotesRequest](docs/CreateItemsQuotesRequest.md)
 - [CreateItemsRecruit200Response](docs/CreateItemsRecruit200Response.md)
 - [CreateItemsRecruitRequest](docs/CreateItemsRecruitRequest.md)
 - [CreateItemsRegulations200Response](docs/CreateItemsRegulations200Response.md)
 - [CreateItemsRegulationsRequest](docs/CreateItemsRegulationsRequest.md)
 - [CreateItemsRentals200Response](docs/CreateItemsRentals200Response.md)
 - [CreateItemsRentalsRequest](docs/CreateItemsRentalsRequest.md)
 - [CreateItemsShipment200Response](docs/CreateItemsShipment200Response.md)
 - [CreateItemsShipmentRequest](docs/CreateItemsShipmentRequest.md)
 - [CreateItemsSocialMedia200Response](docs/CreateItemsSocialMedia200Response.md)
 - [CreateItemsSocialMediaRequest](docs/CreateItemsSocialMediaRequest.md)
 - [CreateItemsSocialResponsibility200Response](docs/CreateItemsSocialResponsibility200Response.md)
 - [CreateItemsSocialResponsibilityRequest](docs/CreateItemsSocialResponsibilityRequest.md)
 - [CreateItemsSuppliers200Response](docs/CreateItemsSuppliers200Response.md)
 - [CreateItemsSuppliersRequest](docs/CreateItemsSuppliersRequest.md)
 - [CreateItemsSurveys200Response](docs/CreateItemsSurveys200Response.md)
 - [CreateItemsSurveysRequest](docs/CreateItemsSurveysRequest.md)
 - [CreateItemsSustainableSupplyChain200Response](docs/CreateItemsSustainableSupplyChain200Response.md)
 - [CreateItemsSustainableSupplyChainRequest](docs/CreateItemsSustainableSupplyChainRequest.md)
 - [CreateItemsTaxes200Response](docs/CreateItemsTaxes200Response.md)
 - [CreateItemsTaxesRequest](docs/CreateItemsTaxesRequest.md)
 - [CreateItemsTraining200Response](docs/CreateItemsTraining200Response.md)
 - [CreateItemsTrainingRequest](docs/CreateItemsTrainingRequest.md)
 - [CreateItemsTransactions200Response](docs/CreateItemsTransactions200Response.md)
 - [CreateItemsTransactionsRequest](docs/CreateItemsTransactionsRequest.md)
 - [CreatePreset200Response](docs/CreatePreset200Response.md)
 - [CreatePresetRequest](docs/CreatePresetRequest.md)
 - [CreatePresetRequestFiltersInner](docs/CreatePresetRequestFiltersInner.md)
 - [Diff](docs/Diff.md)
 - [DiffDiff](docs/DiffDiff.md)
 - [DiffDiffCollectionsInner](docs/DiffDiffCollectionsInner.md)
 - [DiffDiffFieldsInner](docs/DiffDiffFieldsInner.md)
 - [DiffDiffRelationsInner](docs/DiffDiffRelationsInner.md)
 - [ExportRequest](docs/ExportRequest.md)
 - [Fields](docs/Fields.md)
 - [FieldsGroup](docs/FieldsGroup.md)
 - [Files](docs/Files.md)
 - [FilesModifiedBy](docs/FilesModifiedBy.md)
 - [FilesUploadedBy](docs/FilesUploadedBy.md)
 - [Flows](docs/Flows.md)
 - [Folders](docs/Folders.md)
 - [FoldersParent](docs/FoldersParent.md)
 - [GetActivities200Response](docs/GetActivities200Response.md)
 - [GetAsset404Response](docs/GetAsset404Response.md)
 - [GetAsset404ResponseError](docs/GetAsset404ResponseError.md)
 - [GetCollection200Response](docs/GetCollection200Response.md)
 - [GetCollectionField200Response](docs/GetCollectionField200Response.md)
 - [GetCollections200Response](docs/GetCollections200Response.md)
 - [GetFields200Response](docs/GetFields200Response.md)
 - [GetFiles200Response](docs/GetFiles200Response.md)
 - [GetFlow200Response](docs/GetFlow200Response.md)
 - [GetFlows200Response](docs/GetFlows200Response.md)
 - [GetFolders200Response](docs/GetFolders200Response.md)
 - [GetInterfaces200Response](docs/GetInterfaces200Response.md)
 - [GetMyPermissions200Response](docs/GetMyPermissions200Response.md)
 - [GetPermission200Response](docs/GetPermission200Response.md)
 - [GetPermissions200Response](docs/GetPermissions200Response.md)
 - [GetPresets200Response](docs/GetPresets200Response.md)
 - [GetRelation200Response](docs/GetRelation200Response.md)
 - [GetRelations200Response](docs/GetRelations200Response.md)
 - [GetRole200Response](docs/GetRole200Response.md)
 - [GetRoles200Response](docs/GetRoles200Response.md)
 - [GetSettings200Response](docs/GetSettings200Response.md)
 - [GetUser200Response](docs/GetUser200Response.md)
 - [GetUsers200Response](docs/GetUsers200Response.md)
 - [HashGenerate200Response](docs/HashGenerate200Response.md)
 - [HashGenerateRequest](docs/HashGenerateRequest.md)
 - [HashVerify200Response](docs/HashVerify200Response.md)
 - [HashVerifyRequest](docs/HashVerifyRequest.md)
 - [ItemsAccounts](docs/ItemsAccounts.md)
 - [ItemsAccountsRelatedAccount](docs/ItemsAccountsRelatedAccount.md)
 - [ItemsAppointments](docs/ItemsAppointments.md)
 - [ItemsBudgets](docs/ItemsBudgets.md)
 - [ItemsCampaigns](docs/ItemsCampaigns.md)
 - [ItemsCarbonFootprint](docs/ItemsCarbonFootprint.md)
 - [ItemsCarbonFootprintDepartmentId](docs/ItemsCarbonFootprintDepartmentId.md)
 - [ItemsCarbonFootprintLinkedProjectId](docs/ItemsCarbonFootprintLinkedProjectId.md)
 - [ItemsCompanyAssets](docs/ItemsCompanyAssets.md)
 - [ItemsContent](docs/ItemsContent.md)
 - [ItemsContracts](docs/ItemsContracts.md)
 - [ItemsCrm](docs/ItemsCrm.md)
 - [ItemsDepartment](docs/ItemsDepartment.md)
 - [ItemsDepartmentManagerId](docs/ItemsDepartmentManagerId.md)
 - [ItemsDistribution](docs/ItemsDistribution.md)
 - [ItemsEmailCampaigns](docs/ItemsEmailCampaigns.md)
 - [ItemsEmployeeDirectory](docs/ItemsEmployeeDirectory.md)
 - [ItemsEnergyEfficiency](docs/ItemsEnergyEfficiency.md)
 - [ItemsEnergyEfficiencyFacilityId](docs/ItemsEnergyEfficiencyFacilityId.md)
 - [ItemsEnvironmentalCompliance](docs/ItemsEnvironmentalCompliance.md)
 - [ItemsEvents](docs/ItemsEvents.md)
 - [ItemsExpenses](docs/ItemsExpenses.md)
 - [ItemsFacilities](docs/ItemsFacilities.md)
 - [ItemsFeedback](docs/ItemsFeedback.md)
 - [ItemsForum](docs/ItemsForum.md)
 - [ItemsFulfillment](docs/ItemsFulfillment.md)
 - [ItemsFulfillmentCustomerId](docs/ItemsFulfillmentCustomerId.md)
 - [ItemsGovernanceandEthics](docs/ItemsGovernanceandEthics.md)
 - [ItemsGovernanceandEthicsPolicyId](docs/ItemsGovernanceandEthicsPolicyId.md)
 - [ItemsHelpdesk](docs/ItemsHelpdesk.md)
 - [ItemsInventory](docs/ItemsInventory.md)
 - [ItemsInventorySupplierId](docs/ItemsInventorySupplierId.md)
 - [ItemsInvoices](docs/ItemsInvoices.md)
 - [ItemsInvoicing](docs/ItemsInvoicing.md)
 - [ItemsLifecycle](docs/ItemsLifecycle.md)
 - [ItemsLifecycleInventoryProductId](docs/ItemsLifecycleInventoryProductId.md)
 - [ItemsLiveChat](docs/ItemsLiveChat.md)
 - [ItemsLoyalty](docs/ItemsLoyalty.md)
 - [ItemsMaintenance](docs/ItemsMaintenance.md)
 - [ItemsPayroll](docs/ItemsPayroll.md)
 - [ItemsPerformance](docs/ItemsPerformance.md)
 - [ItemsPointofSale](docs/ItemsPointofSale.md)
 - [ItemsPointofSaleCustomerIdInner](docs/ItemsPointofSaleCustomerIdInner.md)
 - [ItemsPolicy](docs/ItemsPolicy.md)
 - [ItemsProcurement](docs/ItemsProcurement.md)
 - [ItemsProductionBatch](docs/ItemsProductionBatch.md)
 - [ItemsProject](docs/ItemsProject.md)
 - [ItemsPurchaseOrders](docs/ItemsPurchaseOrders.md)
 - [ItemsQualityCheck](docs/ItemsQualityCheck.md)
 - [ItemsQuotes](docs/ItemsQuotes.md)
 - [ItemsRecruit](docs/ItemsRecruit.md)
 - [ItemsRegulations](docs/ItemsRegulations.md)
 - [ItemsRentals](docs/ItemsRentals.md)
 - [ItemsShipment](docs/ItemsShipment.md)
 - [ItemsSocialMedia](docs/ItemsSocialMedia.md)
 - [ItemsSocialResponsibility](docs/ItemsSocialResponsibility.md)
 - [ItemsSuppliers](docs/ItemsSuppliers.md)
 - [ItemsSurveys](docs/ItemsSurveys.md)
 - [ItemsSustainableSupplyChain](docs/ItemsSustainableSupplyChain.md)
 - [ItemsTaxes](docs/ItemsTaxes.md)
 - [ItemsTraining](docs/ItemsTraining.md)
 - [ItemsTransactions](docs/ItemsTransactions.md)
 - [Login200Response](docs/Login200Response.md)
 - [Login200ResponseData](docs/Login200ResponseData.md)
 - [LoginRequest](docs/LoginRequest.md)
 - [LogoutRequest](docs/LogoutRequest.md)
 - [Oauth200Response](docs/Oauth200Response.md)
 - [OauthProvider200Response](docs/OauthProvider200Response.md)
 - [OauthProvider200ResponseData](docs/OauthProvider200ResponseData.md)
 - [PasswordRequestRequest](docs/PasswordRequestRequest.md)
 - [PasswordResetRequest](docs/PasswordResetRequest.md)
 - [Permissions](docs/Permissions.md)
 - [Presets](docs/Presets.md)
 - [PresetsCollection](docs/PresetsCollection.md)
 - [PresetsRole](docs/PresetsRole.md)
 - [PresetsUser](docs/PresetsUser.md)
 - [Query](docs/Query.md)
 - [Random200Response](docs/Random200Response.md)
 - [ReadItemsAccounts200Response](docs/ReadItemsAccounts200Response.md)
 - [ReadItemsAppointments200Response](docs/ReadItemsAppointments200Response.md)
 - [ReadItemsBudgets200Response](docs/ReadItemsBudgets200Response.md)
 - [ReadItemsCampaigns200Response](docs/ReadItemsCampaigns200Response.md)
 - [ReadItemsCarbonFootprint200Response](docs/ReadItemsCarbonFootprint200Response.md)
 - [ReadItemsCompanyAssets200Response](docs/ReadItemsCompanyAssets200Response.md)
 - [ReadItemsContent200Response](docs/ReadItemsContent200Response.md)
 - [ReadItemsContracts200Response](docs/ReadItemsContracts200Response.md)
 - [ReadItemsCrm200Response](docs/ReadItemsCrm200Response.md)
 - [ReadItemsDepartment200Response](docs/ReadItemsDepartment200Response.md)
 - [ReadItemsDistribution200Response](docs/ReadItemsDistribution200Response.md)
 - [ReadItemsEmailCampaigns200Response](docs/ReadItemsEmailCampaigns200Response.md)
 - [ReadItemsEmployeeDirectory200Response](docs/ReadItemsEmployeeDirectory200Response.md)
 - [ReadItemsEnergyEfficiency200Response](docs/ReadItemsEnergyEfficiency200Response.md)
 - [ReadItemsEnvironmentalCompliance200Response](docs/ReadItemsEnvironmentalCompliance200Response.md)
 - [ReadItemsEvents200Response](docs/ReadItemsEvents200Response.md)
 - [ReadItemsExpenses200Response](docs/ReadItemsExpenses200Response.md)
 - [ReadItemsFacilities200Response](docs/ReadItemsFacilities200Response.md)
 - [ReadItemsFeedback200Response](docs/ReadItemsFeedback200Response.md)
 - [ReadItemsForum200Response](docs/ReadItemsForum200Response.md)
 - [ReadItemsFulfillment200Response](docs/ReadItemsFulfillment200Response.md)
 - [ReadItemsGovernanceandEthics200Response](docs/ReadItemsGovernanceandEthics200Response.md)
 - [ReadItemsHelpdesk200Response](docs/ReadItemsHelpdesk200Response.md)
 - [ReadItemsInventory200Response](docs/ReadItemsInventory200Response.md)
 - [ReadItemsInvoices200Response](docs/ReadItemsInvoices200Response.md)
 - [ReadItemsInvoicing200Response](docs/ReadItemsInvoicing200Response.md)
 - [ReadItemsLifecycle200Response](docs/ReadItemsLifecycle200Response.md)
 - [ReadItemsLiveChat200Response](docs/ReadItemsLiveChat200Response.md)
 - [ReadItemsLoyalty200Response](docs/ReadItemsLoyalty200Response.md)
 - [ReadItemsMaintenance200Response](docs/ReadItemsMaintenance200Response.md)
 - [ReadItemsPayroll200Response](docs/ReadItemsPayroll200Response.md)
 - [ReadItemsPerformance200Response](docs/ReadItemsPerformance200Response.md)
 - [ReadItemsPointofSale200Response](docs/ReadItemsPointofSale200Response.md)
 - [ReadItemsPolicy200Response](docs/ReadItemsPolicy200Response.md)
 - [ReadItemsProcurement200Response](docs/ReadItemsProcurement200Response.md)
 - [ReadItemsProductionBatch200Response](docs/ReadItemsProductionBatch200Response.md)
 - [ReadItemsProject200Response](docs/ReadItemsProject200Response.md)
 - [ReadItemsPurchaseOrders200Response](docs/ReadItemsPurchaseOrders200Response.md)
 - [ReadItemsQualityCheck200Response](docs/ReadItemsQualityCheck200Response.md)
 - [ReadItemsQuotes200Response](docs/ReadItemsQuotes200Response.md)
 - [ReadItemsRecruit200Response](docs/ReadItemsRecruit200Response.md)
 - [ReadItemsRegulations200Response](docs/ReadItemsRegulations200Response.md)
 - [ReadItemsRentals200Response](docs/ReadItemsRentals200Response.md)
 - [ReadItemsShipment200Response](docs/ReadItemsShipment200Response.md)
 - [ReadItemsSocialMedia200Response](docs/ReadItemsSocialMedia200Response.md)
 - [ReadItemsSocialResponsibility200Response](docs/ReadItemsSocialResponsibility200Response.md)
 - [ReadItemsSuppliers200Response](docs/ReadItemsSuppliers200Response.md)
 - [ReadItemsSurveys200Response](docs/ReadItemsSurveys200Response.md)
 - [ReadItemsSustainableSupplyChain200Response](docs/ReadItemsSustainableSupplyChain200Response.md)
 - [ReadItemsTaxes200Response](docs/ReadItemsTaxes200Response.md)
 - [ReadItemsTraining200Response](docs/ReadItemsTraining200Response.md)
 - [ReadItemsTransactions200Response](docs/ReadItemsTransactions200Response.md)
 - [ReadSingleItemsAccounts200Response](docs/ReadSingleItemsAccounts200Response.md)
 - [ReadSingleItemsAccountsIdParameter](docs/ReadSingleItemsAccountsIdParameter.md)
 - [ReadSingleItemsAppointments200Response](docs/ReadSingleItemsAppointments200Response.md)
 - [ReadSingleItemsBudgets200Response](docs/ReadSingleItemsBudgets200Response.md)
 - [ReadSingleItemsCampaigns200Response](docs/ReadSingleItemsCampaigns200Response.md)
 - [ReadSingleItemsCarbonFootprint200Response](docs/ReadSingleItemsCarbonFootprint200Response.md)
 - [ReadSingleItemsCompanyAssets200Response](docs/ReadSingleItemsCompanyAssets200Response.md)
 - [ReadSingleItemsContent200Response](docs/ReadSingleItemsContent200Response.md)
 - [ReadSingleItemsContracts200Response](docs/ReadSingleItemsContracts200Response.md)
 - [ReadSingleItemsCrm200Response](docs/ReadSingleItemsCrm200Response.md)
 - [ReadSingleItemsDepartment200Response](docs/ReadSingleItemsDepartment200Response.md)
 - [ReadSingleItemsDistribution200Response](docs/ReadSingleItemsDistribution200Response.md)
 - [ReadSingleItemsEmailCampaigns200Response](docs/ReadSingleItemsEmailCampaigns200Response.md)
 - [ReadSingleItemsEmployeeDirectory200Response](docs/ReadSingleItemsEmployeeDirectory200Response.md)
 - [ReadSingleItemsEnergyEfficiency200Response](docs/ReadSingleItemsEnergyEfficiency200Response.md)
 - [ReadSingleItemsEnvironmentalCompliance200Response](docs/ReadSingleItemsEnvironmentalCompliance200Response.md)
 - [ReadSingleItemsEvents200Response](docs/ReadSingleItemsEvents200Response.md)
 - [ReadSingleItemsExpenses200Response](docs/ReadSingleItemsExpenses200Response.md)
 - [ReadSingleItemsFacilities200Response](docs/ReadSingleItemsFacilities200Response.md)
 - [ReadSingleItemsFeedback200Response](docs/ReadSingleItemsFeedback200Response.md)
 - [ReadSingleItemsForum200Response](docs/ReadSingleItemsForum200Response.md)
 - [ReadSingleItemsFulfillment200Response](docs/ReadSingleItemsFulfillment200Response.md)
 - [ReadSingleItemsGovernanceandEthics200Response](docs/ReadSingleItemsGovernanceandEthics200Response.md)
 - [ReadSingleItemsHelpdesk200Response](docs/ReadSingleItemsHelpdesk200Response.md)
 - [ReadSingleItemsInventory200Response](docs/ReadSingleItemsInventory200Response.md)
 - [ReadSingleItemsInvoices200Response](docs/ReadSingleItemsInvoices200Response.md)
 - [ReadSingleItemsInvoicing200Response](docs/ReadSingleItemsInvoicing200Response.md)
 - [ReadSingleItemsLifecycle200Response](docs/ReadSingleItemsLifecycle200Response.md)
 - [ReadSingleItemsLiveChat200Response](docs/ReadSingleItemsLiveChat200Response.md)
 - [ReadSingleItemsLoyalty200Response](docs/ReadSingleItemsLoyalty200Response.md)
 - [ReadSingleItemsMaintenance200Response](docs/ReadSingleItemsMaintenance200Response.md)
 - [ReadSingleItemsPayroll200Response](docs/ReadSingleItemsPayroll200Response.md)
 - [ReadSingleItemsPerformance200Response](docs/ReadSingleItemsPerformance200Response.md)
 - [ReadSingleItemsPointofSale200Response](docs/ReadSingleItemsPointofSale200Response.md)
 - [ReadSingleItemsPolicy200Response](docs/ReadSingleItemsPolicy200Response.md)
 - [ReadSingleItemsProcurement200Response](docs/ReadSingleItemsProcurement200Response.md)
 - [ReadSingleItemsProductionBatch200Response](docs/ReadSingleItemsProductionBatch200Response.md)
 - [ReadSingleItemsProject200Response](docs/ReadSingleItemsProject200Response.md)
 - [ReadSingleItemsPurchaseOrders200Response](docs/ReadSingleItemsPurchaseOrders200Response.md)
 - [ReadSingleItemsQualityCheck200Response](docs/ReadSingleItemsQualityCheck200Response.md)
 - [ReadSingleItemsQuotes200Response](docs/ReadSingleItemsQuotes200Response.md)
 - [ReadSingleItemsRecruit200Response](docs/ReadSingleItemsRecruit200Response.md)
 - [ReadSingleItemsRegulations200Response](docs/ReadSingleItemsRegulations200Response.md)
 - [ReadSingleItemsRentals200Response](docs/ReadSingleItemsRentals200Response.md)
 - [ReadSingleItemsShipment200Response](docs/ReadSingleItemsShipment200Response.md)
 - [ReadSingleItemsSocialMedia200Response](docs/ReadSingleItemsSocialMedia200Response.md)
 - [ReadSingleItemsSocialResponsibility200Response](docs/ReadSingleItemsSocialResponsibility200Response.md)
 - [ReadSingleItemsSuppliers200Response](docs/ReadSingleItemsSuppliers200Response.md)
 - [ReadSingleItemsSurveys200Response](docs/ReadSingleItemsSurveys200Response.md)
 - [ReadSingleItemsSustainableSupplyChain200Response](docs/ReadSingleItemsSustainableSupplyChain200Response.md)
 - [ReadSingleItemsTaxes200Response](docs/ReadSingleItemsTaxes200Response.md)
 - [ReadSingleItemsTraining200Response](docs/ReadSingleItemsTraining200Response.md)
 - [ReadSingleItemsTransactions200Response](docs/ReadSingleItemsTransactions200Response.md)
 - [Refresh200Response](docs/Refresh200Response.md)
 - [Refresh200ResponseData](docs/Refresh200ResponseData.md)
 - [RefreshRequest](docs/RefreshRequest.md)
 - [Relations](docs/Relations.md)
 - [Roles](docs/Roles.md)
 - [RolesUsersInner](docs/RolesUsersInner.md)
 - [Schema](docs/Schema.md)
 - [SchemaApplyRequest](docs/SchemaApplyRequest.md)
 - [SchemaSnapshot200Response](docs/SchemaSnapshot200Response.md)
 - [ServerInfo200Response](docs/ServerInfo200Response.md)
 - [Settings](docs/Settings.md)
 - [SettingsPublicFavicon](docs/SettingsPublicFavicon.md)
 - [SettingsStorageAssetPresetsInner](docs/SettingsStorageAssetPresetsInner.md)
 - [SettingsStorageAssetPresetsInnerTransformsInner](docs/SettingsStorageAssetPresetsInnerTransformsInner.md)
 - [SettingsStorageAssetPresetsInnerTransformsInnerArgumentsInner](docs/SettingsStorageAssetPresetsInnerTransformsInnerArgumentsInner.md)
 - [SortRequest](docs/SortRequest.md)
 - [UpdateFileRequest](docs/UpdateFileRequest.md)
 - [UpdateFileRequest1](docs/UpdateFileRequest1.md)
 - [UpdateFileRequestFolder](docs/UpdateFileRequestFolder.md)
 - [UpdateFilesRequest](docs/UpdateFilesRequest.md)
 - [UpdateFolderRequest](docs/UpdateFolderRequest.md)
 - [UpdateFoldersRequest](docs/UpdateFoldersRequest.md)
 - [UpdateItemsAccounts200Response](docs/UpdateItemsAccounts200Response.md)
 - [UpdateItemsAppointments200Response](docs/UpdateItemsAppointments200Response.md)
 - [UpdateItemsBudgets200Response](docs/UpdateItemsBudgets200Response.md)
 - [UpdateItemsCampaigns200Response](docs/UpdateItemsCampaigns200Response.md)
 - [UpdateItemsCarbonFootprint200Response](docs/UpdateItemsCarbonFootprint200Response.md)
 - [UpdateItemsCompanyAssets200Response](docs/UpdateItemsCompanyAssets200Response.md)
 - [UpdateItemsContent200Response](docs/UpdateItemsContent200Response.md)
 - [UpdateItemsContracts200Response](docs/UpdateItemsContracts200Response.md)
 - [UpdateItemsCrm200Response](docs/UpdateItemsCrm200Response.md)
 - [UpdateItemsDepartment200Response](docs/UpdateItemsDepartment200Response.md)
 - [UpdateItemsDistribution200Response](docs/UpdateItemsDistribution200Response.md)
 - [UpdateItemsEmailCampaigns200Response](docs/UpdateItemsEmailCampaigns200Response.md)
 - [UpdateItemsEmployeeDirectory200Response](docs/UpdateItemsEmployeeDirectory200Response.md)
 - [UpdateItemsEnergyEfficiency200Response](docs/UpdateItemsEnergyEfficiency200Response.md)
 - [UpdateItemsEnvironmentalCompliance200Response](docs/UpdateItemsEnvironmentalCompliance200Response.md)
 - [UpdateItemsEvents200Response](docs/UpdateItemsEvents200Response.md)
 - [UpdateItemsExpenses200Response](docs/UpdateItemsExpenses200Response.md)
 - [UpdateItemsFacilities200Response](docs/UpdateItemsFacilities200Response.md)
 - [UpdateItemsFeedback200Response](docs/UpdateItemsFeedback200Response.md)
 - [UpdateItemsForum200Response](docs/UpdateItemsForum200Response.md)
 - [UpdateItemsFulfillment200Response](docs/UpdateItemsFulfillment200Response.md)
 - [UpdateItemsGovernanceandEthics200Response](docs/UpdateItemsGovernanceandEthics200Response.md)
 - [UpdateItemsHelpdesk200Response](docs/UpdateItemsHelpdesk200Response.md)
 - [UpdateItemsInventory200Response](docs/UpdateItemsInventory200Response.md)
 - [UpdateItemsInvoices200Response](docs/UpdateItemsInvoices200Response.md)
 - [UpdateItemsInvoicing200Response](docs/UpdateItemsInvoicing200Response.md)
 - [UpdateItemsLifecycle200Response](docs/UpdateItemsLifecycle200Response.md)
 - [UpdateItemsLiveChat200Response](docs/UpdateItemsLiveChat200Response.md)
 - [UpdateItemsLoyalty200Response](docs/UpdateItemsLoyalty200Response.md)
 - [UpdateItemsMaintenance200Response](docs/UpdateItemsMaintenance200Response.md)
 - [UpdateItemsPayroll200Response](docs/UpdateItemsPayroll200Response.md)
 - [UpdateItemsPerformance200Response](docs/UpdateItemsPerformance200Response.md)
 - [UpdateItemsPointofSale200Response](docs/UpdateItemsPointofSale200Response.md)
 - [UpdateItemsPolicy200Response](docs/UpdateItemsPolicy200Response.md)
 - [UpdateItemsProcurement200Response](docs/UpdateItemsProcurement200Response.md)
 - [UpdateItemsProductionBatch200Response](docs/UpdateItemsProductionBatch200Response.md)
 - [UpdateItemsProject200Response](docs/UpdateItemsProject200Response.md)
 - [UpdateItemsPurchaseOrders200Response](docs/UpdateItemsPurchaseOrders200Response.md)
 - [UpdateItemsQualityCheck200Response](docs/UpdateItemsQualityCheck200Response.md)
 - [UpdateItemsQuotes200Response](docs/UpdateItemsQuotes200Response.md)
 - [UpdateItemsRecruit200Response](docs/UpdateItemsRecruit200Response.md)
 - [UpdateItemsRegulations200Response](docs/UpdateItemsRegulations200Response.md)
 - [UpdateItemsRentals200Response](docs/UpdateItemsRentals200Response.md)
 - [UpdateItemsShipment200Response](docs/UpdateItemsShipment200Response.md)
 - [UpdateItemsSocialMedia200Response](docs/UpdateItemsSocialMedia200Response.md)
 - [UpdateItemsSocialResponsibility200Response](docs/UpdateItemsSocialResponsibility200Response.md)
 - [UpdateItemsSuppliers200Response](docs/UpdateItemsSuppliers200Response.md)
 - [UpdateItemsSurveys200Response](docs/UpdateItemsSurveys200Response.md)
 - [UpdateItemsSustainableSupplyChain200Response](docs/UpdateItemsSustainableSupplyChain200Response.md)
 - [UpdateItemsTaxes200Response](docs/UpdateItemsTaxes200Response.md)
 - [UpdateItemsTraining200Response](docs/UpdateItemsTraining200Response.md)
 - [UpdateItemsTransactions200Response](docs/UpdateItemsTransactions200Response.md)
 - [UpdateLastUsedPageMeRequest](docs/UpdateLastUsedPageMeRequest.md)
 - [UpdatePresetRequest](docs/UpdatePresetRequest.md)
 - [UpdatePresetRequestFiltersInner](docs/UpdatePresetRequestFiltersInner.md)
 - [UpdatePresetsRequest](docs/UpdatePresetsRequest.md)
 - [UpdateUsersRequest](docs/UpdateUsersRequest.md)
 - [Users](docs/Users.md)
 - [UsersAvatar](docs/UsersAvatar.md)
 - [UsersRole](docs/UsersRole.md)
 - [XMetadata](docs/XMetadata.md)


## Documentation For Authorization


## KeyAuth


- **Type**: API key
- **API key parameter name**: access_token
- **Location**: URL query string

## Auth


- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header

