# ItemsCarbonFootprintApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**createItemsCarbonFootprint**](ItemsCarbonFootprintApi.md#createItemsCarbonFootprint) | **POST** /items/carbon_footprint | Create an Item
[**deleteItemsCarbonFootprint**](ItemsCarbonFootprintApi.md#deleteItemsCarbonFootprint) | **DELETE** /items/carbon_footprint | Delete Multiple Items
[**deleteSingleItemsCarbonFootprint**](ItemsCarbonFootprintApi.md#deleteSingleItemsCarbonFootprint) | **DELETE** /items/carbon_footprint/{id} | Delete an Item
[**readItemsCarbonFootprint**](ItemsCarbonFootprintApi.md#readItemsCarbonFootprint) | **GET** /items/carbon_footprint | List Items
[**readSingleItemsCarbonFootprint**](ItemsCarbonFootprintApi.md#readSingleItemsCarbonFootprint) | **GET** /items/carbon_footprint/{id} | Retrieve an Item
[**updateItemsCarbonFootprint**](ItemsCarbonFootprintApi.md#updateItemsCarbonFootprint) | **PATCH** /items/carbon_footprint | Update Multiple Items
[**updateSingleItemsCarbonFootprint**](ItemsCarbonFootprintApi.md#updateSingleItemsCarbonFootprint) | **PATCH** /items/carbon_footprint/{id} | Update an Item



## createItemsCarbonFootprint

Create an Item

Create a new carbon_footprint item.

### Example

```bash
 createItemsCarbonFootprint  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **createItemsCarbonFootprintRequest** | [**CreateItemsCarbonFootprintRequest**](CreateItemsCarbonFootprintRequest.md) |  | [optional]

### Return type

[**CreateItemsCarbonFootprint200Response**](CreateItemsCarbonFootprint200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteItemsCarbonFootprint

Delete Multiple Items

Delete multiple existing carbon_footprint items.

### Example

```bash
 deleteItemsCarbonFootprint
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


## deleteSingleItemsCarbonFootprint

Delete an Item

Delete an existing carbon_footprint item.

### Example

```bash
 deleteSingleItemsCarbonFootprint id=value
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


## readItemsCarbonFootprint

List Items

List the carbon_footprint items.

### Example

```bash
 readItemsCarbonFootprint  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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

[**ReadItemsCarbonFootprint200Response**](ReadItemsCarbonFootprint200Response.md)

### Authorization

[Auth](../README.md#Auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## readSingleItemsCarbonFootprint

Retrieve an Item

Retrieve a single carbon_footprint item by unique identifier.

### Example

```bash
 readSingleItemsCarbonFootprint id=value  Specify as:  fields="value1,value2,..."  meta=value  version=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **version** | **string** | Retrieve an item's state from a specific Content Version. The value corresponds to the \"key\" of the Content Version. | [optional] [default to null]

### Return type

[**ReadSingleItemsCarbonFootprint200Response**](ReadSingleItemsCarbonFootprint200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateItemsCarbonFootprint

Update Multiple Items

Update multiple carbon_footprint items at the same time.

### Example

```bash
 updateItemsCarbonFootprint  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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
 **createItemsCarbonFootprintRequest** | [**CreateItemsCarbonFootprintRequest**](CreateItemsCarbonFootprintRequest.md) |  | [optional]

### Return type

[**UpdateItemsCarbonFootprint200Response**](UpdateItemsCarbonFootprint200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateSingleItemsCarbonFootprint

Update an Item

Update an existing carbon_footprint item.

### Example

```bash
 updateSingleItemsCarbonFootprint id=value  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **itemsCarbonFootprint** | [**ItemsCarbonFootprint**](ItemsCarbonFootprint.md) |  | [optional]

### Return type

[**ReadSingleItemsCarbonFootprint200Response**](ReadSingleItemsCarbonFootprint200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

