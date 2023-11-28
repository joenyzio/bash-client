# ItemsEnvironmentalComplianceApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**createItemsEnvironmentalCompliance**](ItemsEnvironmentalComplianceApi.md#createItemsEnvironmentalCompliance) | **POST** /items/environmental_compliance | Create an Item
[**deleteItemsEnvironmentalCompliance**](ItemsEnvironmentalComplianceApi.md#deleteItemsEnvironmentalCompliance) | **DELETE** /items/environmental_compliance | Delete Multiple Items
[**deleteSingleItemsEnvironmentalCompliance**](ItemsEnvironmentalComplianceApi.md#deleteSingleItemsEnvironmentalCompliance) | **DELETE** /items/environmental_compliance/{id} | Delete an Item
[**readItemsEnvironmentalCompliance**](ItemsEnvironmentalComplianceApi.md#readItemsEnvironmentalCompliance) | **GET** /items/environmental_compliance | List Items
[**readSingleItemsEnvironmentalCompliance**](ItemsEnvironmentalComplianceApi.md#readSingleItemsEnvironmentalCompliance) | **GET** /items/environmental_compliance/{id} | Retrieve an Item
[**updateItemsEnvironmentalCompliance**](ItemsEnvironmentalComplianceApi.md#updateItemsEnvironmentalCompliance) | **PATCH** /items/environmental_compliance | Update Multiple Items
[**updateSingleItemsEnvironmentalCompliance**](ItemsEnvironmentalComplianceApi.md#updateSingleItemsEnvironmentalCompliance) | **PATCH** /items/environmental_compliance/{id} | Update an Item



## createItemsEnvironmentalCompliance

Create an Item

Create a new environmental_compliance item.

### Example

```bash
 createItemsEnvironmentalCompliance  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **createItemsEnvironmentalComplianceRequest** | [**CreateItemsEnvironmentalComplianceRequest**](CreateItemsEnvironmentalComplianceRequest.md) |  | [optional]

### Return type

[**CreateItemsEnvironmentalCompliance200Response**](CreateItemsEnvironmentalCompliance200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteItemsEnvironmentalCompliance

Delete Multiple Items

Delete multiple existing environmental_compliance items.

### Example

```bash
 deleteItemsEnvironmentalCompliance
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


## deleteSingleItemsEnvironmentalCompliance

Delete an Item

Delete an existing environmental_compliance item.

### Example

```bash
 deleteSingleItemsEnvironmentalCompliance id=value
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


## readItemsEnvironmentalCompliance

List Items

List the environmental_compliance items.

### Example

```bash
 readItemsEnvironmentalCompliance  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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

[**ReadItemsEnvironmentalCompliance200Response**](ReadItemsEnvironmentalCompliance200Response.md)

### Authorization

[Auth](../README.md#Auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## readSingleItemsEnvironmentalCompliance

Retrieve an Item

Retrieve a single environmental_compliance item by unique identifier.

### Example

```bash
 readSingleItemsEnvironmentalCompliance id=value  Specify as:  fields="value1,value2,..."  meta=value  version=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **version** | **string** | Retrieve an item's state from a specific Content Version. The value corresponds to the \"key\" of the Content Version. | [optional] [default to null]

### Return type

[**ReadSingleItemsEnvironmentalCompliance200Response**](ReadSingleItemsEnvironmentalCompliance200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateItemsEnvironmentalCompliance

Update Multiple Items

Update multiple environmental_compliance items at the same time.

### Example

```bash
 updateItemsEnvironmentalCompliance  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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
 **createItemsEnvironmentalComplianceRequest** | [**CreateItemsEnvironmentalComplianceRequest**](CreateItemsEnvironmentalComplianceRequest.md) |  | [optional]

### Return type

[**UpdateItemsEnvironmentalCompliance200Response**](UpdateItemsEnvironmentalCompliance200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateSingleItemsEnvironmentalCompliance

Update an Item

Update an existing environmental_compliance item.

### Example

```bash
 updateSingleItemsEnvironmentalCompliance id=value  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **itemsEnvironmentalCompliance** | [**ItemsEnvironmentalCompliance**](ItemsEnvironmentalCompliance.md) |  | [optional]

### Return type

[**ReadSingleItemsEnvironmentalCompliance200Response**](ReadSingleItemsEnvironmentalCompliance200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

