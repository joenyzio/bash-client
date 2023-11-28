# ItemsEmailCampaignsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**createItemsEmailCampaigns**](ItemsEmailCampaignsApi.md#createItemsEmailCampaigns) | **POST** /items/email_campaigns | Create an Item
[**deleteItemsEmailCampaigns**](ItemsEmailCampaignsApi.md#deleteItemsEmailCampaigns) | **DELETE** /items/email_campaigns | Delete Multiple Items
[**deleteSingleItemsEmailCampaigns**](ItemsEmailCampaignsApi.md#deleteSingleItemsEmailCampaigns) | **DELETE** /items/email_campaigns/{id} | Delete an Item
[**readItemsEmailCampaigns**](ItemsEmailCampaignsApi.md#readItemsEmailCampaigns) | **GET** /items/email_campaigns | List Items
[**readSingleItemsEmailCampaigns**](ItemsEmailCampaignsApi.md#readSingleItemsEmailCampaigns) | **GET** /items/email_campaigns/{id} | Retrieve an Item
[**updateItemsEmailCampaigns**](ItemsEmailCampaignsApi.md#updateItemsEmailCampaigns) | **PATCH** /items/email_campaigns | Update Multiple Items
[**updateSingleItemsEmailCampaigns**](ItemsEmailCampaignsApi.md#updateSingleItemsEmailCampaigns) | **PATCH** /items/email_campaigns/{id} | Update an Item



## createItemsEmailCampaigns

Create an Item

Create a new email_campaigns item.

### Example

```bash
 createItemsEmailCampaigns  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **createItemsEmailCampaignsRequest** | [**CreateItemsEmailCampaignsRequest**](CreateItemsEmailCampaignsRequest.md) |  | [optional]

### Return type

[**CreateItemsEmailCampaigns200Response**](CreateItemsEmailCampaigns200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteItemsEmailCampaigns

Delete Multiple Items

Delete multiple existing email_campaigns items.

### Example

```bash
 deleteItemsEmailCampaigns
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


## deleteSingleItemsEmailCampaigns

Delete an Item

Delete an existing email_campaigns item.

### Example

```bash
 deleteSingleItemsEmailCampaigns id=value
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


## readItemsEmailCampaigns

List Items

List the email_campaigns items.

### Example

```bash
 readItemsEmailCampaigns  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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

[**ReadItemsEmailCampaigns200Response**](ReadItemsEmailCampaigns200Response.md)

### Authorization

[Auth](../README.md#Auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## readSingleItemsEmailCampaigns

Retrieve an Item

Retrieve a single email_campaigns item by unique identifier.

### Example

```bash
 readSingleItemsEmailCampaigns id=value  Specify as:  fields="value1,value2,..."  meta=value  version=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **version** | **string** | Retrieve an item's state from a specific Content Version. The value corresponds to the \"key\" of the Content Version. | [optional] [default to null]

### Return type

[**ReadSingleItemsEmailCampaigns200Response**](ReadSingleItemsEmailCampaigns200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateItemsEmailCampaigns

Update Multiple Items

Update multiple email_campaigns items at the same time.

### Example

```bash
 updateItemsEmailCampaigns  Specify as:  fields="value1,value2,..."  limit=value  meta=value  offset=value  Specify as:  sort="value1,value2,..."  Specify as:  filter=value1 filter=value2 filter=...  search=value
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
 **createItemsEmailCampaignsRequest** | [**CreateItemsEmailCampaignsRequest**](CreateItemsEmailCampaignsRequest.md) |  | [optional]

### Return type

[**UpdateItemsEmailCampaigns200Response**](UpdateItemsEmailCampaigns200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateSingleItemsEmailCampaigns

Update an Item

Update an existing email_campaigns item.

### Example

```bash
 updateSingleItemsEmailCampaigns id=value  Specify as:  fields="value1,value2,..."  meta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**ReadSingleItemsAccountsIdParameter**](.md) | Index of the item. | [default to null]
 **fields** | [**array[string]**](string.md) | Control what fields are being returned in the object. | [optional] [default to null]
 **meta** | **string** | What metadata to return in the response. | [optional] [default to null]
 **itemsEmailCampaigns** | [**ItemsEmailCampaigns**](ItemsEmailCampaigns.md) |  | [optional]

### Return type

[**ReadSingleItemsEmailCampaigns200Response**](ReadSingleItemsEmailCampaigns200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

