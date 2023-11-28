# ItemsEnergyEfficiencyApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**createItemsEnergyEfficiency**](ItemsEnergyEfficiencyApi.md#createItemsEnergyEfficiency) | **POST** /items/energy_efficiency | Create an Item
[**deleteItemsEnergyEfficiency**](ItemsEnergyEfficiencyApi.md#deleteItemsEnergyEfficiency) | **DELETE** /items/energy_efficiency | Delete Multiple Items
[**deleteSingleItemsEnergyEfficiency**](ItemsEnergyEfficiencyApi.md#deleteSingleItemsEnergyEfficiency) | **DELETE** /items/energy_efficiency/{id} | Delete an Item
[**readItemsEnergyEfficiency**](ItemsEnergyEfficiencyApi.md#readItemsEnergyEfficiency) | **GET** /items/energy_efficiency | List Items
[**readSingleItemsEnergyEfficiency**](ItemsEnergyEfficiencyApi.md#readSingleItemsEnergyEfficiency) | **GET** /items/energy_efficiency/{id} | Retrieve an Item
[**updateItemsEnergyEfficiency**](ItemsEnergyEfficiencyApi.md#updateItemsEnergyEfficiency) | **PATCH** /items/energy_efficiency | Update Multiple Items
[**updateSingleItemsEnergyEfficiency**](ItemsEnergyEfficiencyApi.md#updateSingleItemsEnergyEfficiency) | **PATCH** /items/energy_efficiency/{id} | Update an Item



## createItemsEnergyEfficiency

Create an Item

Create a new energy_efficiency item.

### Example

```bash
 createItemsEnergyEfficiency  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **createItemsEnergyEfficiencyRequest** | [**CreateItemsEnergyEfficiencyRequest**](CreateItemsEnergyEfficiencyRequest.md) |  | [optional]

### Return type

[**CreateItemsEnergyEfficiency200Response**](CreateItemsEnergyEfficiency200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteItemsEnergyEfficiency

Delete Multiple Items

Delete multiple existing energy_efficiency items.

### Example

```bash
 deleteItemsEnergyEfficiency
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


## deleteSingleItemsEnergyEfficiency

Delete an Item

Delete an existing energy_efficiency item.

### Example

```bash
 deleteSingleItemsEnergyEfficiency id=value
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


## readItemsEnergyEfficiency

List Items

List the energy_efficiency items.

### Example

```bash
 readItemsEnergyEfficiency  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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

[**ReadItemsEnergyEfficiency200Response**](ReadItemsEnergyEfficiency200Response.md)

### Authorization

[Auth](../README.md#Auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## readSingleItemsEnergyEfficiency

Retrieve an Item

Retrieve a single energy_efficiency item by unique identifier.

### Example

```bash
 readSingleItemsEnergyEfficiency id=value  Specify as:  fields="value1,value2,..."  meta=value  version=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **version** | **string** | Retrieve an item's state from a specific Content Version. The value corresponds to the \"key\" of the Content Version. | [optional] [default to null]

### Return type

[**ReadSingleItemsEnergyEfficiency200Response**](ReadSingleItemsEnergyEfficiency200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateItemsEnergyEfficiency

Update Multiple Items

Update multiple energy_efficiency items at the same time.

### Example

```bash
 updateItemsEnergyEfficiency  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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
 **createItemsEnergyEfficiencyRequest** | [**CreateItemsEnergyEfficiencyRequest**](CreateItemsEnergyEfficiencyRequest.md) |  | [optional]

### Return type

[**UpdateItemsEnergyEfficiency200Response**](UpdateItemsEnergyEfficiency200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateSingleItemsEnergyEfficiency

Update an Item

Update an existing energy_efficiency item.

### Example

```bash
 updateSingleItemsEnergyEfficiency id=value  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **itemsEnergyEfficiency** | [**ItemsEnergyEfficiency**](ItemsEnergyEfficiency.md) |  | [optional]

### Return type

[**ReadSingleItemsEnergyEfficiency200Response**](ReadSingleItemsEnergyEfficiency200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

