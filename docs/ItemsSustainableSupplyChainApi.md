# ItemsSustainableSupplyChainApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**createItemsSustainableSupplyChain**](ItemsSustainableSupplyChainApi.md#createItemsSustainableSupplyChain) | **POST** /items/sustainable_supply_chain | Create an Item
[**deleteItemsSustainableSupplyChain**](ItemsSustainableSupplyChainApi.md#deleteItemsSustainableSupplyChain) | **DELETE** /items/sustainable_supply_chain | Delete Multiple Items
[**deleteSingleItemsSustainableSupplyChain**](ItemsSustainableSupplyChainApi.md#deleteSingleItemsSustainableSupplyChain) | **DELETE** /items/sustainable_supply_chain/{id} | Delete an Item
[**readItemsSustainableSupplyChain**](ItemsSustainableSupplyChainApi.md#readItemsSustainableSupplyChain) | **GET** /items/sustainable_supply_chain | List Items
[**readSingleItemsSustainableSupplyChain**](ItemsSustainableSupplyChainApi.md#readSingleItemsSustainableSupplyChain) | **GET** /items/sustainable_supply_chain/{id} | Retrieve an Item
[**updateItemsSustainableSupplyChain**](ItemsSustainableSupplyChainApi.md#updateItemsSustainableSupplyChain) | **PATCH** /items/sustainable_supply_chain | Update Multiple Items
[**updateSingleItemsSustainableSupplyChain**](ItemsSustainableSupplyChainApi.md#updateSingleItemsSustainableSupplyChain) | **PATCH** /items/sustainable_supply_chain/{id} | Update an Item



## createItemsSustainableSupplyChain

Create an Item

Create a new sustainable_supply_chain item.

### Example

```bash
 createItemsSustainableSupplyChain  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **createItemsSustainableSupplyChainRequest** | [**CreateItemsSustainableSupplyChainRequest**](CreateItemsSustainableSupplyChainRequest.md) |  | [optional]

### Return type

[**CreateItemsSustainableSupplyChain200Response**](CreateItemsSustainableSupplyChain200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteItemsSustainableSupplyChain

Delete Multiple Items

Delete multiple existing sustainable_supply_chain items.

### Example

```bash
 deleteItemsSustainableSupplyChain
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


## deleteSingleItemsSustainableSupplyChain

Delete an Item

Delete an existing sustainable_supply_chain item.

### Example

```bash
 deleteSingleItemsSustainableSupplyChain id=value
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


## readItemsSustainableSupplyChain

List Items

List the sustainable_supply_chain items.

### Example

```bash
 readItemsSustainableSupplyChain  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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

[**ReadItemsSustainableSupplyChain200Response**](ReadItemsSustainableSupplyChain200Response.md)

### Authorization

[Auth](../README.md#Auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## readSingleItemsSustainableSupplyChain

Retrieve an Item

Retrieve a single sustainable_supply_chain item by unique identifier.

### Example

```bash
 readSingleItemsSustainableSupplyChain id=value  Specify as:  fields="value1,value2,..."  meta=value  version=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **version** | **string** | Retrieve an item's state from a specific Content Version. The value corresponds to the \"key\" of the Content Version. | [optional] [default to null]

### Return type

[**ReadSingleItemsSustainableSupplyChain200Response**](ReadSingleItemsSustainableSupplyChain200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateItemsSustainableSupplyChain

Update Multiple Items

Update multiple sustainable_supply_chain items at the same time.

### Example

```bash
 updateItemsSustainableSupplyChain  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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
 **createItemsSustainableSupplyChainRequest** | [**CreateItemsSustainableSupplyChainRequest**](CreateItemsSustainableSupplyChainRequest.md) |  | [optional]

### Return type

[**UpdateItemsSustainableSupplyChain200Response**](UpdateItemsSustainableSupplyChain200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateSingleItemsSustainableSupplyChain

Update an Item

Update an existing sustainable_supply_chain item.

### Example

```bash
 updateSingleItemsSustainableSupplyChain id=value  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **itemsSustainableSupplyChain** | [**ItemsSustainableSupplyChain**](ItemsSustainableSupplyChain.md) |  | [optional]

### Return type

[**ReadSingleItemsSustainableSupplyChain200Response**](ReadSingleItemsSustainableSupplyChain200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

