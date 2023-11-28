# ItemsGovernanceandEthicsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**createItemsGovernanceandEthics**](ItemsGovernanceandEthicsApi.md#createItemsGovernanceandEthics) | **POST** /items/governance_and_ethics | Create an Item
[**deleteItemsGovernanceandEthics**](ItemsGovernanceandEthicsApi.md#deleteItemsGovernanceandEthics) | **DELETE** /items/governance_and_ethics | Delete Multiple Items
[**deleteSingleItemsGovernanceandEthics**](ItemsGovernanceandEthicsApi.md#deleteSingleItemsGovernanceandEthics) | **DELETE** /items/governance_and_ethics/{id} | Delete an Item
[**readItemsGovernanceandEthics**](ItemsGovernanceandEthicsApi.md#readItemsGovernanceandEthics) | **GET** /items/governance_and_ethics | List Items
[**readSingleItemsGovernanceandEthics**](ItemsGovernanceandEthicsApi.md#readSingleItemsGovernanceandEthics) | **GET** /items/governance_and_ethics/{id} | Retrieve an Item
[**updateItemsGovernanceandEthics**](ItemsGovernanceandEthicsApi.md#updateItemsGovernanceandEthics) | **PATCH** /items/governance_and_ethics | Update Multiple Items
[**updateSingleItemsGovernanceandEthics**](ItemsGovernanceandEthicsApi.md#updateSingleItemsGovernanceandEthics) | **PATCH** /items/governance_and_ethics/{id} | Update an Item



## createItemsGovernanceandEthics

Create an Item

Create a new governance_and_ethics item.

### Example

```bash
 createItemsGovernanceandEthics  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **createItemsGovernanceandEthicsRequest** | [**CreateItemsGovernanceandEthicsRequest**](CreateItemsGovernanceandEthicsRequest.md) |  | [optional]

### Return type

[**CreateItemsGovernanceandEthics200Response**](CreateItemsGovernanceandEthics200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteItemsGovernanceandEthics

Delete Multiple Items

Delete multiple existing governance_and_ethics items.

### Example

```bash
 deleteItemsGovernanceandEthics
```

### Parameters

This endpoint does not need any parameter.

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteSingleItemsGovernanceandEthics

Delete an Item

Delete an existing governance_and_ethics item.

### Example

```bash
 deleteSingleItemsGovernanceandEthics id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## readItemsGovernanceandEthics

List Items

List the governance_and_ethics items.

### Example

```bash
 readItemsGovernanceandEthics  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **limit** | **integer** | A limit on the number of objects that are returned. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **offset** | **integer** | How many items to skip when fetching data. | [optional] [default to null]
 **sort** | [**array[string]**](string.md) | How to sort the returned items. 'sort' is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (' - ') can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a ' ? ' to sort randomly. | [optional] [default to null]
 **filter** | [**array[string]**](string.md) | Select items in collection by given conditions. | [optional] [default to null]
 **search** | **string** | Filter by items that contain the given search query in one of their fields. | [optional] [default to null]

### Return type

[**ReadItemsGovernanceandEthics200Response**](ReadItemsGovernanceandEthics200Response.md)

### Authorization

[Auth](../README.md#Auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## readSingleItemsGovernanceandEthics

Retrieve an Item

Retrieve a single governance_and_ethics item by unique identifier.

### Example

```bash
 readSingleItemsGovernanceandEthics id=value  Specify as:  fields="value1,value2,..."  meta=value  version=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **version** | **string** | Retrieve an item's state from a specific Content Version. The value corresponds to the \"key\" of the Content Version. | [optional] [default to null]

### Return type

[**ReadSingleItemsGovernanceandEthics200Response**](ReadSingleItemsGovernanceandEthics200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateItemsGovernanceandEthics

Update Multiple Items

Update multiple governance_and_ethics items at the same time.

### Example

```bash
 updateItemsGovernanceandEthics  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **limit** | **integer** | A limit on the number of objects that are returned. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **offset** | **integer** | How many items to skip when fetching data. | [optional] [default to null]
 **sort** | [**array[string]**](string.md) | How to sort the returned items. 'sort' is a CSV of fields used to sort the fetched items. Sorting defaults to ascending (ASC) order but a minus sign (' - ') can be used to reverse this to descending (DESC) order. Fields are prioritized by their order in the CSV. You can also use a ' ? ' to sort randomly. | [optional] [default to null]
 **filter** | [**array[string]**](string.md) | Select items in collection by given conditions. | [optional] [default to null]
 **search** | **string** | Filter by items that contain the given search query in one of their fields. | [optional] [default to null]
 **createItemsGovernanceandEthicsRequest** | [**CreateItemsGovernanceandEthicsRequest**](CreateItemsGovernanceandEthicsRequest.md) |  | [optional]

### Return type

[**UpdateItemsGovernanceandEthics200Response**](UpdateItemsGovernanceandEthics200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateSingleItemsGovernanceandEthics

Update an Item

Update an existing governance_and_ethics item.

### Example

```bash
 updateSingleItemsGovernanceandEthics id=value  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **itemsGovernanceandEthics** | [**ItemsGovernanceandEthics**](ItemsGovernanceandEthics.md) |  | [optional]

### Return type

[**ReadSingleItemsGovernanceandEthics200Response**](ReadSingleItemsGovernanceandEthics200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

