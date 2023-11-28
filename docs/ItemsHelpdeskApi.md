# ItemsHelpdeskApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**createItemsHelpdesk**](ItemsHelpdeskApi.md#createItemsHelpdesk) | **POST** /items/helpdesk | Create an Item
[**deleteItemsHelpdesk**](ItemsHelpdeskApi.md#deleteItemsHelpdesk) | **DELETE** /items/helpdesk | Delete Multiple Items
[**deleteSingleItemsHelpdesk**](ItemsHelpdeskApi.md#deleteSingleItemsHelpdesk) | **DELETE** /items/helpdesk/{id} | Delete an Item
[**readItemsHelpdesk**](ItemsHelpdeskApi.md#readItemsHelpdesk) | **GET** /items/helpdesk | List Items
[**readSingleItemsHelpdesk**](ItemsHelpdeskApi.md#readSingleItemsHelpdesk) | **GET** /items/helpdesk/{id} | Retrieve an Item
[**updateItemsHelpdesk**](ItemsHelpdeskApi.md#updateItemsHelpdesk) | **PATCH** /items/helpdesk | Update Multiple Items
[**updateSingleItemsHelpdesk**](ItemsHelpdeskApi.md#updateSingleItemsHelpdesk) | **PATCH** /items/helpdesk/{id} | Update an Item



## createItemsHelpdesk

Create an Item

Create a new helpdesk item.

### Example

```bash
 createItemsHelpdesk  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **createItemsHelpdeskRequest** | [**CreateItemsHelpdeskRequest**](CreateItemsHelpdeskRequest.md) |  | [optional]

### Return type

[**CreateItemsHelpdesk200Response**](CreateItemsHelpdesk200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteItemsHelpdesk

Delete Multiple Items

Delete multiple existing helpdesk items.

### Example

```bash
 deleteItemsHelpdesk
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


## deleteSingleItemsHelpdesk

Delete an Item

Delete an existing helpdesk item.

### Example

```bash
 deleteSingleItemsHelpdesk id=value
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


## readItemsHelpdesk

List Items

List the helpdesk items.

### Example

```bash
 readItemsHelpdesk  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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

[**ReadItemsHelpdesk200Response**](ReadItemsHelpdesk200Response.md)

### Authorization

[Auth](../README.md#Auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## readSingleItemsHelpdesk

Retrieve an Item

Retrieve a single helpdesk item by unique identifier.

### Example

```bash
 readSingleItemsHelpdesk id=value  Specify as:  fields="value1,value2,..."  meta=value  version=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **version** | **string** | Retrieve an item's state from a specific Content Version. The value corresponds to the \"key\" of the Content Version. | [optional] [default to null]

### Return type

[**ReadSingleItemsHelpdesk200Response**](ReadSingleItemsHelpdesk200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateItemsHelpdesk

Update Multiple Items

Update multiple helpdesk items at the same time.

### Example

```bash
 updateItemsHelpdesk  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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
 **createItemsHelpdeskRequest** | [**CreateItemsHelpdeskRequest**](CreateItemsHelpdeskRequest.md) |  | [optional]

### Return type

[**UpdateItemsHelpdesk200Response**](UpdateItemsHelpdesk200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateSingleItemsHelpdesk

Update an Item

Update an existing helpdesk item.

### Example

```bash
 updateSingleItemsHelpdesk id=value  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **itemsHelpdesk** | [**ItemsHelpdesk**](ItemsHelpdesk.md) |  | [optional]

### Return type

[**ReadSingleItemsHelpdesk200Response**](ReadSingleItemsHelpdesk200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

