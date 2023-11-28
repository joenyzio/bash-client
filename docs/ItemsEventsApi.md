# ItemsEventsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**createItemsEvents**](ItemsEventsApi.md#createItemsEvents) | **POST** /items/events | Create an Item
[**deleteItemsEvents**](ItemsEventsApi.md#deleteItemsEvents) | **DELETE** /items/events | Delete Multiple Items
[**deleteSingleItemsEvents**](ItemsEventsApi.md#deleteSingleItemsEvents) | **DELETE** /items/events/{id} | Delete an Item
[**readItemsEvents**](ItemsEventsApi.md#readItemsEvents) | **GET** /items/events | List Items
[**readSingleItemsEvents**](ItemsEventsApi.md#readSingleItemsEvents) | **GET** /items/events/{id} | Retrieve an Item
[**updateItemsEvents**](ItemsEventsApi.md#updateItemsEvents) | **PATCH** /items/events | Update Multiple Items
[**updateSingleItemsEvents**](ItemsEventsApi.md#updateSingleItemsEvents) | **PATCH** /items/events/{id} | Update an Item



## createItemsEvents

Create an Item

Create a new events item.

### Example

```bash
 createItemsEvents  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **createItemsEventsRequest** | [**CreateItemsEventsRequest**](CreateItemsEventsRequest.md) |  | [optional]

### Return type

[**CreateItemsEvents200Response**](CreateItemsEvents200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteItemsEvents

Delete Multiple Items

Delete multiple existing events items.

### Example

```bash
 deleteItemsEvents
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


## deleteSingleItemsEvents

Delete an Item

Delete an existing events item.

### Example

```bash
 deleteSingleItemsEvents id=value
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


## readItemsEvents

List Items

List the events items.

### Example

```bash
 readItemsEvents  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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

[**ReadItemsEvents200Response**](ReadItemsEvents200Response.md)

### Authorization

[Auth](../README.md#Auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## readSingleItemsEvents

Retrieve an Item

Retrieve a single events item by unique identifier.

### Example

```bash
 readSingleItemsEvents id=value  Specify as:  fields="value1,value2,..."  meta=value  version=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **version** | **string** | Retrieve an item's state from a specific Content Version. The value corresponds to the \"key\" of the Content Version. | [optional] [default to null]

### Return type

[**ReadSingleItemsEvents200Response**](ReadSingleItemsEvents200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateItemsEvents

Update Multiple Items

Update multiple events items at the same time.

### Example

```bash
 updateItemsEvents  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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
 **createItemsEventsRequest** | [**CreateItemsEventsRequest**](CreateItemsEventsRequest.md) |  | [optional]

### Return type

[**UpdateItemsEvents200Response**](UpdateItemsEvents200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateSingleItemsEvents

Update an Item

Update an existing events item.

### Example

```bash
 updateSingleItemsEvents id=value  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **itemsEvents** | [**ItemsEvents**](ItemsEvents.md) |  | [optional]

### Return type

[**ReadSingleItemsEvents200Response**](ReadSingleItemsEvents200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

